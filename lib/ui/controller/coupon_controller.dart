import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:bumaco_aios/ui/controller/bucket_controller.dart';
import 'package:flutter/material.dart';
import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/repository.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:get/get.dart';

class CouponController extends GetxController {
  static CouponController get to => Get.find(tag: COUPON_CONTROLLER);
  late final TextEditingController couponCTR;
  var isLoading = true.obs;
  late ProductRepository productRepository;
  var couponType = ''.obs;
  var couponValue = 0.0.obs;
  var couponTitle = 'APPLY COUPON/ REFERRAL'.obs;
  var couponSubtitle = ''.obs;
  var couponApplied = false.obs;
  final bController = BucketController.to;

  @override
  void onInit() {
    super.onInit();
    couponCTR = TextEditingController();
    productRepository = Get.put(ProductRepositoryImpl());
  }

  @override
  void onClose() {
    clearPromocode();
    couponCTR.dispose();
    super.onClose();
  }

  clearPromocode() {
    couponCTR.clear();
    couponApplied(false);
    couponType('');
    couponValue(0.0);
    bController.discountAmt(0.0);
    couponSubtitle('');
    couponTitle('APPLY COUPON/ REFERRAL');
  }

  fetchCouponcode() async {
    try {
      if (couponCTR.text.length == 0) {
        bumacoSnackbar('alert'.tr, 'Enter your code');
        return;
      } else if (couponCTR.text.length < 3) {
        bumacoSnackbar('alert'.tr, 'Invalid coupon code!');
        return;
      }
      isLoading(true);
      showLoadingDialog();
      var response = await productRepository.checkCouponcode(couponCTR.text);
      if (response != null) {
        final CouponModel coupon = response;
        print(coupon.coupontype);
        if (coupon.couponvalue!.length > 0 &&
            GetUtils.isNumericOnly(coupon.couponvalue.toString())) {
          couponValue.value = double.parse(coupon.couponvalue.toString());
          couponApplied(true);
          couponTitle(couponCTR.text);
          couponType(coupon.coupontype);
          if (couponType.value.toLowerCase().contains('percent') ||
              couponType.value.toLowerCase().contains('precentage')) {
            bController.discountAmt(
                bController.totalAmount.value * couponValue.value / 100);
          } else {
            bController.discountAmt(couponValue.value);
          }
          couponSubtitle('Promo/Referral code applied successfully!');
          Get.back();
          Get.back();
        } else {
          couponApplied(false);
          couponCTR.clear();
        }
        bumacoSnackbar('alert'.tr, '${coupon.amount} Value found');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      hideLoadingDialog();
    }
  }
}

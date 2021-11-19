import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  static ProductDetailController get to =>
      Get.find(tag: PRODUCT_DETAIL_CONTROLLER);
  var pincode = ''.obs;
  late final pincodeCTR;
  var avalablePincode = false.obs;
  late final ProductModel productItem;
  late final List<String> options;
  var choiceIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pincodeCTR = TextEditingController();
    options = ['50ml', '80ml', '130ml', '200ml'];
    if (Get.arguments != null) {
      productItem = Get.arguments['arg_product_item'];
    } else {
      bumacoSnackbar('alert'.tr, 'Details not found!');
      Get.back();
    }
  }

  @override
  void onClose() {
    pincodeCTR.dispose();
    super.onClose();
  }

  checkPincodeAvailability(context) async {
    if (pincode.value.length < 3) {
      bumacoSnackbar('alert'.tr, 'Please enter your pincode');
      return;
    }
    showLoadingDialog();
    await Future.delayed(1000.milliseconds);
    hideLoading();
    avalablePincode(true);
    bumacoSnackbar('alert'.tr,
        'This product is available to your location for delivery and COD is acceptable');
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}

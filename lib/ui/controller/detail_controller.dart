import 'dart:math';

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
  late final sizeChoiceList = <BannerModel>[];
  late final shadeChoiceList = <BannerModel>[];
  var sizeChoiceIndex = 0.obs; //size,weight etc.
  var shadeChoiceIndex = 0.obs; //shade,color etc.

  @override
  void onInit() {
    super.onInit();
    try {
      if (Get.arguments != null) {
        productItem = Get.arguments['arg_product_item'];
      } else {
        bumacoSnackbar('alert'.tr, 'Details not found!');
        Get.back();
      }
    } on Exception catch (e) {
      print(e);
    }
    pincodeCTR = TextEditingController();
    int tempValue = 50;
    for (int i = 0; i < 7; i++) {
      sizeChoiceList
          .add(BannerModel(id: '${i + 1}', bannertext: '${tempValue}ml'));
      tempValue += 30;
    }
    for (int i = 0; i < 8; i++) {
      shadeChoiceList.add(BannerModel(
        id: '${i + 1}',
        bannertext: 'shadegreeenbluemix$i', // '${getRandomString(10)}',
        category: '#aa112233',
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
            .withOpacity(1.0),
      ));
      tempValue += 30;
    }
    // sizeChoiceList = ['50ml', '80ml', '130ml', '200ml'];
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

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bumaco_aios/ui/rating/smiley_controller.dart';
import 'package:get/get.dart';

class RatingController extends GetxController {
  static RatingController get to => Get.find(tag: RATING_CONTROLLER);

  var rating = 4.0.obs;
  var currentAnimation = '4+'.obs;
  late final smileyController;
  late final titleCTR, descriptionCTR;
  late final ProductModel productItem;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      productItem = Get.arguments['arg_product_item'];
    } else {
      bumacoSnackbar('alert'.tr, 'Details not found!');
      Get.back();
    }
    smileyController = SmileyController();
    titleCTR = TextEditingController();
    descriptionCTR = TextEditingController();
  }

  @override
  void onClose() {
    smileyController.dispose();
    titleCTR.dispose();
    descriptionCTR.dispose();
    super.onClose();
  }

  void onChanged(double v) {
    if (rating.value == v) return;
    if (v < 1.0) return;

    var direction = rating.value < v ? '+' : '-';
    rating.value = v;
    currentAnimation.value = '${v.round()}$direction';
  }

  void submitRatingButton() async {
    if (titleCTR.text.length < 1) {
      bumacoSnackbar('alert'.tr, 'Please enter title!');
      return;
    }
    showLoadingDialog();
    await Future.delayed(2.seconds);
    hideLoading();
    bumacoSnackbar('alert'.tr, 'Review submitted successfully!');
    clearData();
  }

  clearData() {
    titleCTR.clear();
    descriptionCTR.clear();
  }
}

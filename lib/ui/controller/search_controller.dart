import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static SearchController get to => Get.find(tag: SEARCH_CONTROLLER);
  late AnimationController aController;
  // late Animation animation;

  @override
  void onInit() {
    super.onInit();
    aController = AnimationController(vsync: this, duration: 10.seconds);
    aController.repeat(reverse: true);
    // animation = Tween(begin: 2, end: 15).animate(_aController)
    //   ..addListener(() {
    //     update();
    //   });
  }

  @override
  void onClose() {
    aController.dispose();
    super.onClose();
  }
}

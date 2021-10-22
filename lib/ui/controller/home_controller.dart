import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find(tag: HOME_CONTROLLER);
  late ScrollController scrollController = ScrollController();
  var offset = 0.0;
  var showFAB = true.obs;
  @override
  void onInit() {
    addScrollListener();
    super.onInit();
  }

  @override
  void onClose() {
    // _timer.cancel();
    scrollController.removeListener(() {
      print('home scrollControl removed');
    });
    super.onClose();
  }

  addScrollListener() {
    scrollController.addListener(() {
      offset = scrollController.offset;
      if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        showFAB.value = true;
        print(showFAB.value);
      } else {
        if (showFAB.isTrue) {
          showFAB.value = false;
          print(showFAB.value);
        }
      }
    });
  }
}

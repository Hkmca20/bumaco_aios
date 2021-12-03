import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/login/gate_view.dart';
import 'package:bumaco_aios/ui/login/landing_view.dart';
import 'package:bumaco_aios/ui/login/signin_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';

class OnboardController extends GetxController {
  static OnboardController get to => Get.find(tag: ONBOARD_CONTROLLER);

  var selectedPageIndex = 0.obs;

  bool get isLastPage => selectedPageIndex.value == onboardingList.length - 1;

  var pageController = PageController();

  List<BannerModel> onboardingList = [];

  final box = GetStorage(BOX_APP);
  int get appOpenCount => getStorageIntValue(BOX_APP_OPEN_COUNT);

  OnboardController() {
    _addItemToList();
  }
  forwardAction() {
    if (isLastPage) {
      Get.toNamed(gateRoute);
      box.write(BOX_APP_OPEN_COUNT, appOpenCount + 1);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  _addItemToList() {
    onboardingList.add(BannerModel(
        // image: 'assets/images/order.png',
        image: onboard_1c,
        bannertext: 'WELCOME',
        category: 'You are all set to get everything you want at 9 gates.'));
    onboardingList.add(BannerModel(
        // image: 'assets/images/cook.png',
        image: onboard_2c,
        bannertext: 'WELCOME',
        category: 'You are all set to get everything you want at 9 gates.'));
    onboardingList.add(BannerModel(
        // image: 'assets/images/deliver.png',
        image: onboard_3c,
        bannertext: 'WELCOME',
        category: 'You are all set to get everything you want at 9 gates.'));
    onboardingList.add(BannerModel(
        // image: 'assets/images/deliver.png',
        image: onboard_4c,
        bannertext: 'EXPLORE',
        category:
            'Explore the exclusive deals on almost everything at 9 gates!'));
    onboardingList.add(BannerModel(
        // image: 'assets/images/deliver.png',
        image: onboard_5c,
        bannertext: 'READY',
        category:
            'Get started to shop for your favourite products at 9 gates!'));
  }
}

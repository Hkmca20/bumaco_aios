import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
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
      Get.toNamed(landingRoute);
      box.write(BOX_APP_OPEN_COUNT, appOpenCount + 1);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  _addItemToList() {
    onboardingList.add(BannerModel(
        image: 'assets/images/order.png',
        bannertext: 'How to select or find a product',
        category:
            'This is contains of 9 gates, You may select a gate from category list and enter you will find a sub category gate then search any product you required. Now you can order anytime right from your mobile'));
    onboardingList.add(BannerModel(
        image: 'assets/images/cook.png',
        bannertext: 'Add to cart/ prepare/ checkout and payment',
        category:
            'Go to product page either by search them or from a gate then click on add to cart option, got to cart page from home page or other page top right cornor clicking on bag then proceed to payment for order products'));
    onboardingList.add(BannerModel(
        image: 'assets/images/deliver.png',
        bannertext: 'Faster delivery',
        category:
            'After successful order you can track your order by order id you have and get your delivery information by given helpline number by third party delivery provider'));
  }
}

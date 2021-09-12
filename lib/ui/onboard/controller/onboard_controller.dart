import 'package:bumaco_aios/ui/onboard/model/onboard_info.dart';
import 'package:bumaco_aios/ui/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class OnboardingController extends GetxController {
  static OnboardingController get to => Get.find(tag: '_onboard_controller');

  var selectedPageIndex = 0.obs;

  bool get isLastPage => selectedPageIndex.value == onboardingList.length - 1;

  var pageController = PageController();

  List<OnboardInfo> onboardingList = [];

  OnboardingController() {
    _addItemToList();
  }
  forwardAction() {
    if (isLastPage) {
      print('------------gotoHomePage()');
      Get.to(()=>LoginPage());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  _addItemToList() {
    onboardingList.add(OnboardInfo('assets/images/order.png', 'Order your food',
        'Now you can order food anytime right from your mobile'));
    onboardingList.add(OnboardInfo(
        'assets/images/cook.png',
        'Cooking safe food',
        'We are maintain safety and we keep clean while making food'));
    onboardingList.add(OnboardInfo(
        'assets/images/deliver.png',
        'Quick delivery',
        'Order your favorite meals will be immediately deliver'));
  }
}

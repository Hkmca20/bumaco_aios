import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/onboard/model/onboard_info.dart';
import 'package:bumaco_aios/ui/login/login_view.dart';
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

  List<OnboardInfo> onboardingList = [];

  final box = GetStorage(BOX_APP);
  int get appOpenCount => box.read(BOX_APP_OPEN_COUNT) ?? 0;

  OnboardController() {
    _addItemToList();
  }
  forwardAction() {
    if (isLastPage) {
      Get.to(() => LoginView());
      box.write(BOX_APP_OPEN_COUNT, appOpenCount + 1);
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

import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  // static DashboardController get to => Get.find(tag: DASHBOARD_CONTROLLER);
  int tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}

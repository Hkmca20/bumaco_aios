import 'package:bumaco_aios/ui/dashboard/dashboard_controller.dart';
import 'package:bumaco_aios/ui/home/HomeController.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}

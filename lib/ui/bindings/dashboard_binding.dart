import 'package:bumaco_aios/app_core/repository/category_repo.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/controller/home_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(), fenix: true,
    //  tag: DASHBOARD_CONTROLLER
     );
    Get.lazyPut(() => CategoryRepoImpl(), fenix: true);

    Get.lazyPut(() => HomeController(), fenix: true,
    tag: HOME_CONTROLLER
    );
    Get.lazyPut(() => SearchController(), fenix: true,
    tag: SEARCH_CONTROLLER
    );
  }
}

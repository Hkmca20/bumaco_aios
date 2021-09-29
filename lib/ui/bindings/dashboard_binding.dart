import 'package:bumaco_aios/app_core/repository/category_repo.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/home/HomeController.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController(), fenix: true);
    Get.lazyPut(() => ChildCategoryController(), fenix: true);
    Get.lazyPut(() => SubCategoryController(), fenix: true);
    Get.lazyPut(() => CategoryRepoImpl(), fenix: true);
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}

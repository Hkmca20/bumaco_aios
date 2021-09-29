import 'package:bumaco_aios/app_core/repository/category_repo.dart';
import 'package:get/get.dart';

class CategoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryRepoImpl(), fenix: true);
  }

}
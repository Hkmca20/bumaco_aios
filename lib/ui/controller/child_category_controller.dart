import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/category_repo.dart';
import 'package:get/get.dart';

class ChildCategoryController extends GetxController {
  late CategoryRepo _categoryRepo;

  ChildCategoryController() {
    _categoryRepo = Get.find<CategoryRepoImpl>();
    fetchChildCategory();
  }
  late RxList<ChildCategoryModel> childCategoryList = <ChildCategoryModel>[].obs;
  RxBool isLoading = false.obs;
  
  void fetchChildCategory() async {
    isLoading.toggle();

    final result = await _categoryRepo.getChildCategory();

    isLoading.toggle();

    if (result != null) {
      childCategoryList = result.obs;
    } else {
      print('=======No childCategoryList found========');
    }
  }
}

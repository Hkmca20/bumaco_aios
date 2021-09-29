import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/category_repo.dart';
import 'package:get/get.dart';

class SubCategoryController extends GetxController {
  late CategoryRepo _categoryRepo;

  SubCategoryController() {
    _categoryRepo = Get.find<CategoryRepoImpl>();
    fetchSubCategory();
  }
  late RxList<SubCategoryModel> subCategoryList = <SubCategoryModel>[].obs;
  RxBool isLoading = false.obs;
  
  void fetchSubCategory() async {
    isLoading.toggle();

    final result = await _categoryRepo.getSubCategory();

    isLoading.toggle();

    if (result != null) {
      subCategoryList = result.obs;
    } else {
      print('=======No subCategoryList found========');
    }
  }
}
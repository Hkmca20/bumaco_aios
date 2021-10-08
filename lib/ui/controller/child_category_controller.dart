import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/category_repo.dart';
import 'package:get/get.dart';

class ChildCategoryController extends GetxController {
  late CategoryRepo _categoryRepo;
  String categoryId = '';
  setCategoryId(id) {
    categoryId = id;
    fetchChildCategory(categoryId);
  }

  ChildCategoryController() {
    _categoryRepo = Get.find<CategoryRepoImpl>();
  }
  final RxList childCategoryList = <ChildCategoryModel>[].obs;
  RxBool isLoading = false.obs;

  void fetchChildCategory(categoryId) async {
    isLoading.toggle();

    final result = await _categoryRepo.getChildCategory(categoryId);

    isLoading.toggle();

    if (result != null) {
      childCategoryList.addAll(result);
      childCategoryList.addAll(result);
      childCategoryList.addAll(result);
      childCategoryList.addAll(result);
      childCategoryList.addAll(result);
      childCategoryList.addAll(result);
      childCategoryList.addAll(result);
      childCategoryList.addAll(result);
      childCategoryList.addAll(result);
      childCategoryList.addAll(result);
    } else {
      print('=======No childCategoryList found========');
    }
  }
}

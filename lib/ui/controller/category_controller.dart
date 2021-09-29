import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/category_repo.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  late CategoryRepo _categoryRepo;

  CategoryController() {
    _categoryRepo = Get.find<CategoryRepoImpl>();
    fetchCategory();
  }
  late RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxBool isLoading = false.obs;

  void fetchCategory() async {
    isLoading.toggle();

    final result = await _categoryRepo.getCategory();

    isLoading.toggle();

    if (result != null) {
      categoryList = result.obs;
    } else {
      print('=======No categoryList found========');
    }
  }
}

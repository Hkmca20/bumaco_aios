import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/category_repo.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:get/get.dart';

class SubCategoryController extends GetxController {
  static SubCategoryController get to => Get.find(tag: S_CATEGORY_CONTROLLER);
  late CategoryRepo _categoryRepo;
  late final CategoryData categoryData;
  final args = Get.arguments;

  SubCategoryController() {
    _categoryRepo = Get.find<CategoryRepoImpl>();
  }
  @override
  onInit() {
    super.onInit();
    if (args != null) {
      categoryData = args['arg_category_item'] ?? '';
      fetchSubCategory(categoryData.id);
    }
  }

  late RxList<SubCategoryModel> subCategoryList = <SubCategoryModel>[].obs;
  RxBool isLoading = false.obs;

  void fetchSubCategory(String categoryId) async {
    isLoading.toggle();
    final result = await _categoryRepo.getSubCategory(categoryId);
    isLoading.toggle();

    if (result != null) {
      subCategoryList = result.obs;
    } else {
      print('=======No subCategoryList found========');
    }
  }
}

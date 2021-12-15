import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/category_repo.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:get/get.dart';

class ChildCategoryController extends GetxController {
  static ChildCategoryController get to => Get.find(tag: C_CATEGORY_CONTROLLER);
  late CategoryRepo _categoryRepo;
  late final SubCategoryModel subCategoryItem;
  final args = Get.arguments;

  ChildCategoryController() {
    _categoryRepo = Get.find<CategoryRepoImpl>();
  }
  @override
  onInit() {
    super.onInit();
    if (args != null) {
      subCategoryItem = args['arg_subcategory_item'] ?? '';
      print('check---------------->${subCategoryItem.id}');
      fetchChildCategory(subCategoryItem.id);
    }
  }

  final RxList childCategoryList = <ChildCategoryModel>[].obs;
  RxBool isLoading = false.obs;

  void fetchChildCategory(categoryId) async {
    isLoading.toggle();
    final result = await _categoryRepo.getChildCategory(categoryId);
    isLoading.toggle();

    if (result != null) {
      childCategoryList.addAll(result);
    } else {
      print('=======No childCategoryList found========');
    }
  }
}

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/category_repo.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.find(tag: CATEGORY_CONTROLLER);
  late CategoryRepo _categoryRepo;

  CategoryController() {
    _categoryRepo = Get.find<CategoryRepoImpl>();
    fetchCategory();
  }
  List<CategoryModel> dummyCatList = [
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Makeup"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Hair"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Face"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Appliance"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Electronics"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Cloths"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Dress"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Others"),
  ];
  late RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxBool isLoading = false.obs;

  void fetchCategory() async {
    isLoading.toggle();

    final result = await _categoryRepo.getCategory();
    isLoading.toggle();

    if (result != null) {
      categoryList.addAll(result);
    } else {
      print('=======No categoryList found========');
      categoryList.value = dummyCatList;
      categoryList.addAll(dummyCatList);
    }
  }
}

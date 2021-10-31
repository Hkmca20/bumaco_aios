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
        bannerimage: "20210921090917_316976.jpg",
        image: "20210921090917_488404.jpg",
        category: "Makeup"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_513258.jpg",
        category: "Skin"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921080915_851527.jpg",
        image: "20210921080915_492297.jpg",
        category: "Hair"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090921_805391.jpg",
        image: "20210921090902_513258.jpg",
        category: "Face"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090921_805391.jpg",
        image: "20210921090921_675042.jpg",
        category: "Appliance"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Personal Care"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Natural"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Mom & Baby"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Health & Wellness"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Men"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Fragrances"),
  ];
  List<CategoryModel> dummyChildList = [
    CategoryModel(
        id: '1',
        bannerimage: "20210921090917_316976.jpg",
        image: "20210921090917_488404.jpg",
        category: "Face"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_513258.jpg",
        category: "Eyes"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921080915_851527.jpg",
        image: "20210921080915_492297.jpg",
        category: "Lips"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090921_805391.jpg",
        image: "20210921090921_675042.jpg",
        category: "Bydy Art"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090921_805391.jpg",
        image: "20210921090921_675042.jpg",
        category: "Nails"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Makeup Kits"),
    CategoryModel(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Tools & Brushes"),
  ];
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxBool isLoading = false.obs;

  void fetchCategory() async {
    isLoading.toggle();

    final result = await _categoryRepo.getCategory();
    isLoading.toggle();

    // if (result != null) {
    // categoryList.addAll(result);
    // } else {
    print('=======No categoryList found========');
    categoryList.value = dummyCatList;
    // }
  }
}

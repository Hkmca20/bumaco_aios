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
  // List<Categoryi> dummyCatList = [
  //   Categoryi(
  //       id: '1',
  //       bannerimage: "20210921090917_316976.jpg",
  //       image: "20210921090917_488404.jpg",
  //       category: "Makeup"),
  //   Categoryi(
  //       id: '1',
  //       bannerimage: "20210921090902_637035.jpg",
  //       image: "20210921090902_513258.jpg",
  //       category: "Skin"),
  //   Categoryi(
  //       id: '1',
  //       bannerimage: "20210921080915_851527.jpg",
  //       image: "20210921080915_492297.jpg",
  //       category: "Hair"),
  //   Categoryi(
  //       id: '1',
  //       bannerimage: "20210921090921_805391.jpg",
  //       image: "20210921090902_513258.jpg",
  //       category: "Face"),
  //   Categoryi(
  //       id: '1',
  //       bannerimage: "20210921090921_805391.jpg",
  //       image: "20210921090921_675042.jpg",
  //       category: "Appliance"),
  //   Categoryi(
  //       id: '1',
  //       bannerimage: "20210921090902_637035.jpg",
  //       image: "20210921090902_637035.jpg",
  //       category: "Personal Care"),
  //   Categoryi(
  //       id: '1',
  //       bannerimage: "20210921090902_637035.jpg",
  //       image: "20210921090902_637035.jpg",
  //       category: "Natural"),
  //   Categoryi(
  //       id: '1',
  //       bannerimage: "20210921090902_637035.jpg",
  //       image: "20210921090902_637035.jpg",
  //       category: "Mom & Baby"),
  //   Categoryi(
  //       id: '1',
  //       bannerimage: "20210921090902_637035.jpg",
  //       image: "20210921090902_637035.jpg",
  //       category: "Health & Wellness"),
  //   Categoryi(
  //       id: '1',
  //       bannerimage: "20210921090902_637035.jpg",
  //       image: "20210921090902_637035.jpg",
  //       category: "Men"),
  //   Categoryi(
  //       id: '1',
  //       bannerimage: "20210921090902_637035.jpg",
  //       image: "20210921090902_637035.jpg",
  //       category: "Fragrances"),
  // ];
  List<CategoryData> dummyChildList = [
    CategoryData(
        id: '1',
        bannerimage: "20210921090917_316976.jpg",
        image: "20210921090917_488404.jpg",
        category: "Face"),
    CategoryData(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_513258.jpg",
        category: "Eyes"),
    CategoryData(
        id: '1',
        bannerimage: "20210921080915_851527.jpg",
        image: "20210921080915_492297.jpg",
        category: "Lips"),
    CategoryData(
        id: '1',
        bannerimage: "20210921090921_805391.jpg",
        image: "20210921090921_675042.jpg",
        category: "Bydy Art"),
    CategoryData(
        id: '1',
        bannerimage: "20210921090921_805391.jpg",
        image: "20210921090921_675042.jpg",
        category: "Nails"),
    CategoryData(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Makeup Kits"),
    CategoryData(
        id: '1',
        bannerimage: "20210921090902_637035.jpg",
        image: "20210921090902_637035.jpg",
        category: "Tools & Brushes"),
  ];
  RxList<CategoryData> categoryList = <CategoryData>[].obs;
  RxBool isLoading = false.obs;

  void fetchCategory() async {
    isLoading.toggle();

    final List<CategoryData>? result = await _categoryRepo.getCategory();
    print('category set----------------------${categoryList.length}');
    if (result != null) {
      categoryList.addAll(result);
    }
    isLoading.toggle();

    // if (result == null) {
    //   print('=======No categoryList found========');
    //   categoryList.value = dummyCatList;
    // }
  }
}

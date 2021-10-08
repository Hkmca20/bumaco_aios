import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/category_repo.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  late CategoryRepo _categoryRepo;

  CategoryController() {
    _categoryRepo = Get.find<CategoryRepoImpl>();
    fetchCategory();
  }
  List<CategoryModel> dummyCatList = [
    CategoryModel(
        id: '1',
        bannerimage: "https://picsum.photos/250?image=8",
        image: "https://picsum.photos/250?image=17",
        category: "Makeup"),
    CategoryModel(
        id: '1',
        bannerimage: "https://picsum.photos/250?image=10",
        image: "https://picsum.photos/250?image=18",
        category: "Hair"),
    CategoryModel(
        id: '1',
        bannerimage: "https://picsum.photos/250?image=11",
        image: "https://picsum.photos/250?image=19",
        category: "Face"),
    CategoryModel(
        id: '1',
        bannerimage: "https://picsum.photos/250?image=12",
        image: "https://picsum.photos/250?image=20",
        category: "Appliance"),
    CategoryModel(
        id: '1',
        bannerimage: "https://picsum.photos/250?image=13",
        image: "https://picsum.photos/250?image=21",
        category: "Electronics"),
    CategoryModel(
        id: '1',
        bannerimage: "https://picsum.photos/250?image=14",
        image: "https://picsum.photos/250?image=22",
        category: "Cloths"),
    CategoryModel(
        id: '1',
        bannerimage: "https://picsum.photos/250?image=15",
        image: "https://picsum.photos/250?image=23",
        category: "Dress"),
    CategoryModel(
        id: '1',
        bannerimage: "https://picsum.photos/250?image=16",
        image: "https://picsum.photos/250?image=24",
        category: "Others"),
  ];
  late RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxBool isLoading = false.obs;

  void fetchCategory() async {
    isLoading.toggle();

    final result = await _categoryRepo.getCategory();
    await Future.delayed(Duration(seconds: 2));
    isLoading.toggle();

    if (result != null) {
      categoryList.addAll(result) ;
    } else {
    print('=======No categoryList found========');
    categoryList.value = dummyCatList;
    categoryList.addAll(dummyCatList);
    }
  }
}

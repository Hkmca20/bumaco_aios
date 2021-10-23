import 'package:bumaco_aios/app_core/models/banner_list_model.dart';
import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/banner_repo.dart';
import 'package:bumaco_aios/app_core/repository/category_repo.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get to => Get.find(tag: BANNER_CONTROLLER);
  late BannerRepo _bannerRepo;

  BannerController() {
    _bannerRepo = Get.find<BannerRepoImpl>();
    // fetchHomeSlider();
    fetchBanners();
  }

  late RxList<BannerListModel> bannerPositionList = <BannerListModel>[].obs;
  late RxList<BannerModel> sliderList = <BannerModel>[].obs;
  RxBool isLoading = false.obs;

  void fetchHomeSlider() async {
    isLoading.toggle();

    final result = await _bannerRepo.getBannerHomeSlider();
    isLoading.toggle();

    if (result != null) {
      sliderList.addAll(result);
    } else {
      print('=======No categoryList found========');
    }
  }

  Future<void> fetchBanners() async {
    var result;
    isLoading.toggle();
    result = await _bannerRepo.getBannerHomeSlider();
    if (result != null) {
      sliderList.addAll(result);
      bannerPositionList.add(
          BannerListModel(bannerposition: 'homeslider', bannerlist: result));
    } else {
      print('=======No HomeSliderList found========');
    }
    for (int i = 1; i < 18; i++) {
      result = await _bannerRepo.getBannerPositions(i);
      if (result != null) {
        bannerPositionList.add(
            BannerListModel(bannerposition: 'position$i', bannerlist: result));
      } else {
        print('=======Not found BannerList for pos:$i ========');
      }
    }
    isLoading.toggle();
  }
}

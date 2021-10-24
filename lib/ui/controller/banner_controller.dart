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
    addItemToListPosition();
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
      bannerPositionList.insert(
          0, BannerListModel(bannerposition: 'homeslider', bannerlist: result));
    } else {
      print('=======No HomeSliderList found========');
    }
    isLoading.toggle();
    for (int i = 1; i < 18; i++) {
      result = await _bannerRepo.getBannerPositions(i);
      if (result != null) {
        bannerPositionList.insert(i,
            BannerListModel(bannerposition: 'position$i', bannerlist: result));
      } else {
        print('=======Not found BannerList at pos:$i ========');
      }
    }
  }

  void addItemToListPosition() {
    bannerPositionList
        .add(BannerListModel(bannerposition: 'homeslider', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position1', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position2', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position3', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position4', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position5', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position6', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position7', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position8', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position9', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position10', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position11', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position12', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position13', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position14', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position15', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position16', bannerlist: []));
    bannerPositionList
        .add(BannerListModel(bannerposition: 'position17', bannerlist: []));
  }
}

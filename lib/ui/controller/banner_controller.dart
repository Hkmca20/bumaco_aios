import 'package:bumaco_aios/app_core/models/banner_list_model.dart';
import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/banner_repo.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class BannerController extends GetxController {
  static BannerController get to => Get.find(tag: BANNER_CONTROLLER);
  late BannerRepo _bannerRepo;

  BannerController() {
    addItemToListPosition();
    _bannerRepo = Get.find<BannerRepoImpl>();
    // final close = VxToast.showLoading(ctx, msg: 'Loading..');
    fetchBanners().then((value) => print('Banner completed------>'));
  }

  RxList<BannerListModel> bannerPositionList = <BannerListModel>[].obs;
  RxList<BannerModel> sliderList = <BannerModel>[].obs;
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
    var bannerResponse, sliderResponse;
    isLoading.toggle();
    sliderResponse = await _bannerRepo.getBannerHomeSlider();
    bannerPositionList[bannerPositionList
            .indexWhere((element) => element.bannerposition == 'homeslider')] =
        BannerListModel(
            bannerposition: 'homeslider', bannerlist: sliderResponse);

    bannerResponse = await _bannerRepo.getBannerPositionAll();
    if (bannerResponse != null) {
      sliderList.value = bannerResponse;

      for (int i = 1; i < 18; i++) {
        List<BannerModel> tempList1 = <BannerModel>[];
        tempList1.addAll(sliderList
            .where((e) => e.bannerposition.toLowerCase() == 'position$i'));

        bannerPositionList[bannerPositionList.indexWhere(
                (element) => element.bannerposition == 'position$i')] =
            BannerListModel(
                bannerposition: 'position$i', bannerlist: tempList1);
      }
    } else {
      print('=======No HomeSliderList found========');
    }
    isLoading.toggle();
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

  var ctx;
  void setContext(BuildContext context) {
    ctx = context;
  }

  final landingBannerList = <BannerModel>[
        BannerModel(
            bannertext: 'Beauty Gate',
            image:
                'https://i.ibb.co/YtRkZBH/Whats-App-Image-2021-10-23-at-10-17-32-PM.jpg'),
        BannerModel(
            bannertext: 'Beauty Gate',
            image:
                'https://i.ibb.co/YtRkZBH/Whats-App-Image-2021-10-23-at-10-17-32-PM.jpg'),
        BannerModel(
            bannertext: 'Fashion Gate',
            image:
                'https://i.ibb.co/JyXz8nT/Whats-App-Image-2021-10-23-at-10-16-53-PM.jpg'),
        BannerModel(
            bannertext: 'Antiques Gate',
            image:
                'https://i.ibb.co/xYh55kS/Whats-App-Image-2021-10-23-at-10-16-18-PM.jpg'),
      ],
      landingGateList = [
        BannerModel(
            bannertext: 'Beauty Gate',
            image:
                'https://i.ibb.co/YtRkZBH/Whats-App-Image-2021-10-23-at-10-17-32-PM.jpg'),
        BannerModel(
            bannertext: 'Fashion Gate',
            image:
                'https://i.ibb.co/JyXz8nT/Whats-App-Image-2021-10-23-at-10-16-53-PM.jpg'),
        BannerModel(
            bannertext: 'Antiques Gate',
            image:
                'https://i.ibb.co/xYh55kS/Whats-App-Image-2021-10-23-at-10-16-18-PM.jpg'),
        BannerModel(
            bannertext: 'Modern Arts Gate',
            image:
                'https://i.ibb.co/YtRkZBH/Whats-App-Image-2021-10-23-at-10-17-32-PM.jpg'),
        BannerModel(
            bannertext: 'Altaras & Sports Gate',
            image:
                'https://i.ibb.co/JyXz8nT/Whats-App-Image-2021-10-23-at-10-16-53-PM.jpg'),
        BannerModel(
            bannertext: 'Stars & Fans Gate',
            image:
                'https://i.ibb.co/xYh55kS/Whats-App-Image-2021-10-23-at-10-16-18-PM.jpg'),
        BannerModel(
            bannertext: 'Pets Gate',
            image:
                'https://i.ibb.co/YtRkZBH/Whats-App-Image-2021-10-23-at-10-17-32-PM.jpg'),
        BannerModel(
            bannertext: 'Bikes & Moto Gate',
            image:
                'https://i.ibb.co/JyXz8nT/Whats-App-Image-2021-10-23-at-10-16-53-PM.jpg'),
        BannerModel(
            bannertext: 'Rent & Shared Gate',
            image:
                'https://i.ibb.co/xYh55kS/Whats-App-Image-2021-10-23-at-10-16-18-PM.jpg'),
      ];
}

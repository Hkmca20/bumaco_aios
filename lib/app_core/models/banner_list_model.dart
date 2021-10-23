import 'package:bumaco_aios/app_core/models/banner_model.dart';

class BannerListModel {
  BannerListModel({
    this.id = '',
    this.bannertext = '',
    this.bannerposition = '',
    this.bannerlist,
    this.status = true,
  });

  String id;
  String bannertext;
  String bannerposition;
  List<BannerModel>? bannerlist = <BannerModel>[];
  bool status;
}

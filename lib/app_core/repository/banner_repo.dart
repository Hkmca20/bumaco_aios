import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/network/dio_client.dart';
import 'package:bumaco_aios/network/dio_client_impl.dart';
import 'package:get/get.dart';

abstract class BannerRepo {
  Future<List<BannerModel>?> getBannerHomeSlider();
  Future<List<BannerModel>?> getBannerPositions(position);
  Future<List<BannerModel>?> getBannerPosition2(id);
}

class BannerRepoImpl extends BannerRepo {
  late DioClient _client;
  BannerRepoImpl() {
    _client = Get.put(DioClientImpl());
    // _client.init();
  }

  @override
  Future<List<BannerModel>?> getBannerHomeSlider() async {
    final response;
    try {
      response = await _client.getRequest(ApiConstants.bannerSliderApi);
      // if there is a key before array, use this : return (response.data['data'] as List).map((child)=> Children.fromJson(child)).toList();
      final sliderList =
          (response.data as List).map((x) => BannerModel.fromJson(x)).toList();
      return sliderList;
    } on Exception catch (error, stacktrace) {
      print(error);
      return null;
      // throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  @override
  Future<List<BannerModel>?> getBannerPositions(position) async {
    final response;
    try {
      response = await _client.getRequest('${ApiConstants.bannerApi}$position');
      final responseList =
          (response.data as List).map((x) => BannerModel.fromJson(x)).toList();
      return responseList;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<BannerModel>?> getBannerPosition2(id) async {
    final response;
    try {
      response = await _client
          .getRequest('${ApiConstants.bannerApi}2');
      final responseList =
          (response.data as List).map((x) => BannerModel.fromJson(x)).toList();
      return responseList;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}

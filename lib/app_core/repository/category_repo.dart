import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/network/dio_client.dart';
import 'package:bumaco_aios/network/dio_client_impl.dart';
import 'package:get/get.dart';

abstract class CategoryRepo {
  Future<List<CategoryModel>?> getCategory();

  Future<List<ChildCategoryModel>?> getChildCategory();

  Future<List<SubCategoryModel>?> getSubCategory();
}

class CategoryRepoImpl extends CategoryRepo {
  late DioClient _client;
  CategoryRepoImpl() {
    _client = Get.put(DioClientImpl());
    _client.init();
  }

  @override
  Future<List<CategoryModel>?> getCategory() async {
    final response;
    try {
      response = await _client.getRequest(ApiConstants.categoryApi);
      // if there is a key before array, use this : return (response.data['data'] as List).map((child)=> Children.fromJson(child)).toList();
      final categoryList = (response.data as List)
          .map((x) => CategoryModel.fromJson(x))
          .toList();
      return categoryList;
    } on Exception catch (error,stacktrace) {
      print(error);
      // return null;
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  @override
  Future<List<ChildCategoryModel>?> getChildCategory() async {
    final response;
    try {
      response = await _client.getRequest(ApiConstants.childCategoryApi);
      final responseList = (response.data as List)
          .map((x) => ChildCategoryModel.fromJson(x))
          .toList();
      return responseList;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<SubCategoryModel>?> getSubCategory() async {
    final response;
    try {
      response = await _client.getRequest(ApiConstants.subCategoryApi);
      final responseList = (response.data as List)
          .map((x) => SubCategoryModel.fromJson(x))
          .toList();
      return responseList;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}

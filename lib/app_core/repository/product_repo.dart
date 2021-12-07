import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/models/product_makeup_model.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/network/dio_client.dart';
import 'package:bumaco_aios/network/dio_client_impl.dart';
import 'package:get/get.dart';

abstract class ProductRepository {
  Future<List<ProductModel>?> getProduct(categoryId);
  Future<List<ProductModel>?> searchProduct(searchStr);
  Future<List<ProductModel>?> getProductAll();
  Future<List<ProductMakeupModel>?> getProductMakeup();
}

class ProductRepositoryImpl extends ProductRepository {
  late DioClient _client;
  ProductRepositoryImpl() {
    _client = Get.put(DioClientImpl());
    // _client.init();
  }

  @override
  Future<List<ProductModel>?> getProductAll() async {
    final response;
    try {
      response = await _client.getRequest(ApiConstants.allProductApi);
      final allProductList =
          (response.data as List).map((x) => ProductModel.fromJson(x)).toList();
      return allProductList;
    } on Exception catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Future<List<ProductModel>?> getProduct(categoryId) async {
    final response;
    try {
      response = await _client.getRequest(ApiConstants.productApi + categoryId);
      final productList =
          (response.data as List).map((x) => ProductModel.fromJson(x)).toList();
      return productList;
    } on Exception catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Future<List<ProductModel>?> searchProduct(searchStr) async {
    final response;
    try {
      response =
          await _client.getRequest(ApiConstants.searchFilterApi + searchStr);
      final productList =
          (response.data as List).map((x) => ProductModel.fromJson(x)).toList();
      return productList;
    } on Exception catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Future<List<ProductMakeupModel>?> getProductMakeup() async {
    final response;
    try {
      response = await _client.getRequest(ApiConstants.productMakeupApi);
      final productList = (response.data as List)
          .map((x) => ProductMakeupModel.fromJson(x))
          .toList();
      return productList;
    } on Exception catch (error, stacktrace) {
      print(error);
      // return null;
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/network/dio_client1.dart';
import 'package:bumaco_aios/network/dio_client_impl1.dart';
import 'package:get/get.dart';

abstract class ProductRepository {
  Future<List<ProductModel>?> getProduct();
}

class ProductRepositoryImpl extends ProductRepository {
  late DioClient1 _client;
  ProductRepositoryImpl() {
    _client = Get.put(DioClientImpl1());
    _client.init();
  }

  @override
  Future<List<ProductModel>?> getProduct() async {
    final response;
    try {
      response = await _client.getRequest(ApiConstants.productApi);
      final productList =
          (response.data as List).map((x) => ProductModel.fromJson(x)).toList();
      return productList;
    } on Exception catch (error, stacktrace) {
      print(error);
      // return null;
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}

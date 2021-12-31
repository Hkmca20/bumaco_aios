import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/models/product_makeup_model.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/network/dio_client.dart';
import 'package:bumaco_aios/network/dio_client_impl.dart';
import 'package:get/get.dart';

abstract class ProductRepository {
  Future<List<ProductModel>?> getProductById(categoryId);
  Future<List<ProductModel>?> getProductSearch(searchStr);
  Future<List<ProductModel>?> getProductAll();
  Future<List<ProductModel>?> getProductHome();
  Future<String?> bookProductorder(productIds, totalAmt, taxAmt, discountAmt,
      shippingAmt, payableAmt, status, paymentId);
  Future<CouponModel?> checkCouponcode(couponcode);
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
      response = await _client.getRequest(ApiConstants.productApiAll);
      final result =
          (response.data as List).map((x) => ProductModel.fromJson(x)).toList();
      return result;
    } on Exception catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Future<List<ProductModel>?> getProductHome() async {
    final response;
    try {
      Map<String, dynamic> params = {};
      response = await _client.request(
          ApiConstants.productApiHome, Method.GET, params);
      final result =
          (response.data as List).map((x) => ProductModel.fromJson(x)).toList();
      return result;
    } on Exception catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Future<CouponModel?> checkCouponcode(couponcode) async {
    final response;
    try {
      Map<String, dynamic> params = {
        'userid': getStorageStringValue(BOX_CUSTOMER_ID),
        'coupon_code': couponcode,
      };
      response =
          await _client.request(ApiConstants.couponApi, Method.POST, params);
      final result = CouponModel.fromJson(response.data);
      return result;
    } on Exception catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Future<String?> bookProductorder(productIds, totalAmt, taxAmt, discountAmt,
      shippingAmt, payableAmt, status, paymentId) async {
    final response;
    try {
      Map<String, dynamic> params = {
        'userid': getStorageStringValue(BOX_CUSTOMER_ID),
        'product_id': productIds,
        'retail': totalAmt,
        'tax_amt': taxAmt,
        'discount_amt': discountAmt,
        'shipping_amt': shippingAmt,
        'total_price': payableAmt,
        'total_amout': totalAmt,
        'payable_amout': payableAmt,
        'status': status,
        'payment_id': paymentId,
      };
      response =
          await _client.request(ApiConstants.orderApi, Method.POST, params);
      final result = response.data.toString();
      return result;
    } on Exception catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Future<List<ProductModel>?> getProductById(categoryId) async {
    final response;
    try {
      response = await _client.getRequest(ApiConstants.productApi + categoryId);
      final result =
          (response.data as List).map((x) => ProductModel.fromJson(x)).toList();
      return result;
    } on Exception catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Future<List<ProductModel>?> getProductSearch(searchStr) async {
    final response;
    try {
      response = await _client
          .getRequest(ApiConstants.productApiSearchFilter + searchStr);
      final result =
          (response.data as List).map((x) => ProductModel.fromJson(x)).toList();
      return result;
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
      final result = (response.data as List)
          .map((x) => ProductMakeupModel.fromJson(x))
          .toList();
      return result;
    } on Exception catch (error, stacktrace) {
      print(error);
      // return null;
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}

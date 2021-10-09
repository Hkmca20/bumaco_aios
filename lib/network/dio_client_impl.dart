import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/network/dio_interceptor.dart';
import 'package:bumaco_aios/network/dio_client.dart';
import 'package:dio/dio.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }
const BASE_URL = ApiConstants.baseUrlApi;
const API_KEY = ApiConstants.apiKey;

class DioClientImpl extends DioClient {
  late Dio _dio;

  @override
  Future<DioClient> init() async {
    _dio = Dio(
      BaseOptions(
        headers: header,
        baseUrl: BASE_URL,
        connectTimeout: 50000,
        receiveTimeout: 30000,
      ),
    )..interceptors.add(DioLogging());
    return this;
  }

  Map<String, String> header = {
    'Content-Type': 'application/json; charset=UTF-8',
    // 'Access-Control-Allow-Origin': '.htaccess',
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    // "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS
    // "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
    "Access-Control-Allow-Methods": "GET,POST,OPTIONS,DELETE,PUT",
    'Authorization': 'Bearer $API_KEY'
  };

  @override
  Future<Response> getRequest(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      if (e.response != null) {
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
        print(e.message);
        throw Exception(e.message);
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
        throw Exception(e.message);
      }
    }
    return response;
  }

  @override
  Future request(
      String url, Method method, Map<String, dynamic>? params) async {
    Response response;

    try {
      if (method == Method.POST) {
        response = await _dio.post(url, data: params);
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else {
        response = await _dio.get(
          url,
          queryParameters: params,
        );
      }

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something Went Wrong");
      }
      // } on SocketException catch (e) {
      //   throw Exception("No Internet Connection");
    } on FormatException {
      throw Exception("Bad Response Format!");
    } on DioError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception("Something Went Wrong");
    }
  }
}

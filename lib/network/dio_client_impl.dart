import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/network/dio_interceptor.dart';
import 'package:bumaco_aios/network/dio_client.dart';
import 'package:dio/dio.dart';

const BASE_URL = ApiConstants.baseUrlApi;
const API_KEY = ApiConstants.apiKey;

class DioClientImpl extends DioClient {
  late Dio _dio;
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
  void init() {
    _dio = Dio(
      BaseOptions(
        headers: header,
        baseUrl: BASE_URL,
        connectTimeout: 50000,
        receiveTimeout: 30000,
      ),
    )..interceptors.add(DioLogging());
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
}

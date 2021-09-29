import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/network/dio_interceptor.dart';
import 'package:bumaco_aios/network/dio_client1.dart';
import 'package:dio/dio.dart';

const BASE_URL = 'https://newsapi.org/v2/';
// const BASE_URL = ApiConstants.baseUrlApi;
const API_KEY = ApiConstants.apiKey;
// https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=60b65cc18763454eaf48d48406105496
// https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=60b65cc18763454eaf48d48406105496

class DioClientImpl1 extends DioClient1 {
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
        baseUrl: BASE_URL,
        headers: {'Authorization': 'Bearer $API_KEY'},
        connectTimeout: 50000,
        receiveTimeout: 30000,
      ),
    )..interceptors.add(DioLogging());
  }
}

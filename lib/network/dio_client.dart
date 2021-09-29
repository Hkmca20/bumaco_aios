import 'package:dio/dio.dart';

abstract class DioClient {
  void init();

  Future<Response> getRequest(String url);
  
}

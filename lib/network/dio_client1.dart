import 'package:dio/dio.dart';

abstract class DioClient1 {
  void init();

  Future<Response> getRequest(String url);
  
}

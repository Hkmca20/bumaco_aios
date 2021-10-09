import 'package:get/get.dart';

import 'dio_client_impl.dart';

abstract class DioClient extends GetxService {
  Future<DioClient> init();

  Future<dynamic> getRequest(String url);

  Future<dynamic> request(
      String url, Method method, Map<String, dynamic>? params);
}

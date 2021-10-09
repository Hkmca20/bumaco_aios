import 'package:bumaco_aios/network/dio_client.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  late DioClient client;
  @override
  void onInit() {
    client = Get.find();
    super.onInit();
  }
}

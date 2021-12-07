import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/network/dio_client.dart';
import 'package:bumaco_aios/network/dio_client_impl.dart';
import 'package:get/get.dart';

abstract class LoginRepo {
  Future<LoginModel?> getLogin(phone);
}

class LoginRepoImpl extends LoginRepo {
  late DioClient _client;

  LoginRepoImpl() {
    _client = Get.put(DioClientImpl());
  }
  @override
  Future<LoginModel?> getLogin(phone) async {
    final response;
    try {
      var params = {
        'phone': phone,
        // 'phone': '9760909895',
        'password': '123456',
        'email': 'Sachin.K@gmail.com',
        'name': 'Sachin K.',
        'id': 17,
      };
      response =
          await _client.request(ApiConstants.loginApi, Method.POST, params);

      final int statusCode = response.statusCode;
      LoginModel loginRepo = LoginModel.fromJson(response.data);

      print('loginRepo.toString()======================$statusCode');
      print(loginRepo.message);
      return loginRepo;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}

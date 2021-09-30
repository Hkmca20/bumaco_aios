import 'package:bumaco_aios/app_core/models/user_model.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/network/dio_client.dart';
import 'package:bumaco_aios/network/dio_client_impl.dart';
import 'package:get/get.dart';

abstract class UserRepo {
  Future<List<UserModel>?> getAllUser(); //To not use in this app
}

class UserModelImpl extends UserRepo {
  late DioClient _client;
  UserModelImpl() {
    _client = Get.put(DioClientImpl());
    _client.init();
  }
  @override
  Future<List<UserModel>?> getAllUser() async {
    final response;
    try {
      response = await _client.getRequest(ApiConstants.allUserApi);

      final userList =
          (response.data as List).map((x) => UserModel.fromJson(x)).toList();
      return userList;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}

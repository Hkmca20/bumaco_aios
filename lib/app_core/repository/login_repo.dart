import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/network/dio_client.dart';
import 'package:bumaco_aios/network/dio_client_impl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

abstract class LoginRepo {
  Future<LoginModel?> checkLogin(isLoginMobileNumber, phoneOrEmail);
  Future<LoginModel?> getLogin(
      isLoginMobileNumber, phone, isOTP, otpOrPassword);
  Future<bool> updateProfile(LoginData loginData);
}

class LoginRepoImpl extends LoginRepo {
  late DioClient _client;

  LoginRepoImpl() {
    _client = Get.put(DioClientImpl());
  }

  @override
  Future<LoginModel?> checkLogin(isLoginMoibileNumber, phoneOrEmail) async {
    final response;
    try {
      var phone = '', email = '';
      if (isLoginMoibileNumber) {
        phone = phoneOrEmail;
      } else {
        email = phoneOrEmail;
      }
      var params = {'phone': phone, 'email': email};
      response =
          await _client.request(ApiConstants.loginApi, Method.POST, params);

      LoginModel loginRepo;
      try {
        String checkMessage = response.data['message'];
        if (checkMessage.contains('register')) {
          loginRepo = LoginModel(
            status: true,
            message: 'Otp is sent to your mobile number',
            loginData: LoginData(
                id: response.data['data'].toString(),
                phone: phone,
                email: email,
                otp: '246810',
                createDate: DateTime.now(),
                modifiDate: DateTime.now()),
          );
          putStorageValue(BOX_CUSTOMER_ID, loginRepo.loginData.id);
          Get.back();
          Get.toNamed(otpRoute,
              arguments: {'arg_customer': loginRepo.loginData});
        } else {
          loginRepo = LoginModel.fromJson(response.data);
        }
      } on Exception catch (e) {
        print(e);
        return null;
      }
      return loginRepo;
    } on Exception catch (e) {
      print('error1=>$e');
      late final eMessage;
      if (e.toString().contains('SocketException')) {
        eMessage = 'No internet connection';
      } else {
        eMessage = 'Something Went Wrong';
      }
      throw Exception(eMessage);
      // return Future.error(e);
    }
  }

  @override
  Future<LoginModel?> getLogin(
      isLoginMobileNumber, mobileOrEmail, isOTP, otpOrPassword) async {
    final response;
    try {
      var phone = '', email = '', otp = '', password = '';
      var params = {
        'phone': phone,
        'email': email,
        'otp': otp,
        'password': password,
        'id': getStorageStringValue(BOX_CUSTOMER_ID),
      };
      response =
          await _client.request(ApiConstants.userloginApi, Method.POST, params);

      var loginRepo = LoginModel.fromJson(response.data);
      return loginRepo;
    } on Exception catch (e) {
      print('error=>$e');
      return null;
    }
  }

  @override
  Future<bool> updateProfile(LoginData loginData) async {
    final response;
    try {
      var params = {
        'id': getStorageIntValue(BOX_CUSTOMER_ID),
        'name': loginData.name,
        'phone': loginData.phone,
        'email': loginData.email,
        'password': loginData.password,
      };
      response =
          await _client.request(ApiConstants.profileApi, Method.PUT, params);

      final status = response.data['status'];
      if (status) {
        bumacoSnackbar('alert'.tr, response.data['message']);
      }
      return status;
    } on Exception catch (e) {
      print('error=>$e');
      return false;
    }
  }
}

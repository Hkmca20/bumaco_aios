import 'dart:async';

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:bumaco_aios/ui/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find(tag: LOGIN_CONTROLLER);
  final mobileCTR = TextEditingController();
  RxBool isLoggedIn = false.obs;
  Rx<UserModel> userModel = UserModel().obs;

  @override
  void onClose() {
    mobileCTR.clear();
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.onClose();
  }

  final box = GetStorage(BOX_APP);
  late Timer _timer;
  submitSignIn() {
    try {
      if (mobileCTR.text.length < 5) {
        Get.snackbar('Error', 'Invalid Mobile number');
        return;
      }
      showLoading();
      _timer = Timer(Duration(milliseconds: 2000), () {
        Get.back();
        if (mobileCTR.text == '9999999999') {
          Get.snackbar('Login', 'OTP sent successfully on ${mobileCTR.text}');
          box.write(BOX_MOBILE_EMAIL, mobileCTR.text);
          Get.toNamed(otpRoute);
        } else {
          Get.snackbar('Login', 'Failed, please try again!');
        }
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.back();
      Get.snackbar("Failed", "Please check your internet conection");
    }
  }
}

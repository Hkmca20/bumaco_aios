import 'dart:async';

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:bumaco_aios/ui/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find(tag: LOGIN_CONTROLLER);
  final mobileCTR = TextEditingController();
  RxBool isLoggedIn = false.obs;
  Rx<UserModel> userModel = UserModel().obs;

  @override
  void onClose() {
    super.onClose();
    mobileCTR.clear();
  }

  final box = GetStorage(BOX_APP);
  submitSignIn() async {
    if (mobileCTR.text.length < 5) {
      bumacoSnackbar('Error', 'Invalid Mobile number');
      return;
    }
    showLoading();
    await Future.delayed(Duration(seconds: 3));
    try {
      Get.back();
      if (mobileCTR.text == '9999999999') {
        // Get.toNamed(otpRoute, arguments: 'OTP has been sent to ${mobileCTR.text}');
        bumacoSnackbar('Login', 'OTP sent successfully on ${mobileCTR.text}');
        box.write(BOX_MOBILE_EMAIL, mobileCTR.text);
        Get.toNamed(otpRoute);
      } else {
        bumacoSnackbar('Login', 'Failed, please try again!');
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.back();
      bumacoSnackbar("Failed", "Please check your internet conection");
    }
  }
}

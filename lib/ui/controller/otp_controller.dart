import 'dart:async';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OTPController extends GetxController {
  static OTPController get to => Get.find(tag: OTP_CONTROLLER);
  var initialValue = 30;
  var resendText = ''.obs;
  var canResendOTP = false.obs;
  final otpCTR = TextEditingController();
  // var otpText = '';
  final box = GetStorage(BOX_APP);
  late Timer _timerOTP;

  // updateOtp(otp) {
  //   otpText = otp;
  // }

  @override
  void onInit() {
    _timerOTP = Timer.periodic(
        Duration(seconds: 1),
        (t) => {
              resendText.value = 'resend_otp'.tr +
                  ' ' +
                  'in'.tr +
                  ' $initialValue ' +
                  'seconds'.tr,
              initialValue--,
              if (initialValue <= 0)
                {
                  _timerOTP.cancel(),
                  canResendOTP.value = true,
                  resendText.value = 'resend_otp'.tr,
                }
            });
    super.onInit();
  }

  @override
  void onClose() {
    otpCTR.clear();
    if (_timerOTP.isActive) {
      _timerOTP.cancel();
    }
    super.onClose();
  }

  submitOTP() async {
    if (otpCTR.text.length < 4) {
      bumacoSnackbar('error'.tr, 'Invalid OTP');
      return;
    }
    showLoadingDialog();
    await Future.delayed(Duration(microseconds: 3000));
    try {
      Get.back();
      if (otpCTR.text == '12345') {
        Get.snackbar(
          'login'.tr,
          'Successfull!',
        );
        box.write(BOX_IS_LOGGEDIN, true);
        Get.offAllNamed(dashboardRoute);
      } else {
        bumacoSnackbar(
          'login'.tr,
          'Incorrect otp, please try again!',
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.back();
      bumacoSnackbar('Failed', 'Please check your internet conection');
    }
  }
}

import 'dart:async';
import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:bumaco_aios/ui/login/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OTPController extends GetxController {
  static OTPController get to => Get.find(tag: OTP_CONTROLLER);
  var initialValue = 30;
  var resendText = ''.obs;
  var canResendOTP = false.obs;
  var isLoading = false.obs;
  final otpCTR = TextEditingController();
  final box = GetStorage(BOX_APP);
  late final Timer _timerOTP;
  late final LoginData? argUser;

  @override
  void onInit() {
    argUser = Get.arguments['arg_customer'];

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
    print('--------onClosed');
    otpCTR.clear();
    otpCTR.dispose();
    if (_timerOTP.isActive) {
      _timerOTP.cancel();
    }
    super.onClose();
  }

  @override
  void onReady() {
    print('--------onReady');
    super.onReady();
  }

  @override
  void disposeId(Object id) {
    print('--------onDisposed------');
    super.disposeId(id);
  }

  submitOTP() async {
    if (otpCTR.text.length < 4) {
      bumacoSnackbar('error'.tr, 'Invalid OTP');
      return;
    }
    isLoading.toggle();
    showLoadingDialog();
    await Future.delayed(Duration(milliseconds: 1500));
    try {
      Get.back();
      if (otpCTR.text == '12345') {
        Get.snackbar(
          'login'.tr,
          'Successfull!',
        );
        await Future.delayed(Duration(milliseconds: 500));
        box.write(BOX_IS_LOGGEDIN, true);
        if (true) {
          //todo goto register condition
          Get.offAll(() => SignupView());
          // } else {//todo goto already profile created condition
          //   Get.offAllNamed(dashboardRoute);
        }
      } else {
        bumacoSnackbar(
          'login'.tr,
          'Incorrect otp, please try again!',
        );
      }
      isLoading.toggle();
    } catch (e) {
      debugPrint(e.toString());
      Get.back();
      bumacoSnackbar('Failed', 'Please check your internet conection');
    }
  }
}

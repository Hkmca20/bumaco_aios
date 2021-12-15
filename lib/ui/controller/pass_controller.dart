import 'dart:async';
import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/repository.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:bumaco_aios/ui/login/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PassController extends GetxController {
  static PassController get to => Get.find(tag: PASS_CONTROLLER);
  var initialValue = 30;
  var resendText = ''.obs;
  var isLoading = false.obs;
  final passCTR = TextEditingController();
  final box = GetStorage(BOX_APP);
  late final LoginData? argCustomer;

  @override
  void onInit() {
    argCustomer = Get.arguments['arg_customer'];
    resendText.value = 'Login with OTP';
    super.onInit();
  }

  @override
  void onClose() {
    print('--------onClosed');
    passCTR.clear();
    passCTR.dispose();
    super.onClose();
  }

  submitPassword() async {
    if (passCTR.text.length == 0) {
      bumacoSnackbar('error'.tr, 'Please enter password');
      return;
    }
    isLoading.toggle();
    print(argCustomer!.password);
    showLoadingDialog();
    await Future.delayed(Duration(milliseconds: 1500));
    try {
      Get.back();
      if (passCTR.text == argCustomer!.password) {
        Get.snackbar(
          'login'.tr,
          'Successfull!',
        );
        putStorageValue(BOX_CUSTOMER_ID,
            argCustomer!.id); //I saved in login repo this field
        putStorageValue(BOX_IS_LOGGEDIN, true);
        putStorageValue(BOX_NAME, argCustomer!.name);
        putStorageValue(BOX_MOBILE, argCustomer!.phone);
        putStorageValue(BOX_EMAIL, argCustomer!.email);
        putStorageValue(BOX_PASSWORD, argCustomer!.password);

        if (argCustomer!.password == null ||
            argCustomer!.password!.length < 4) {
          Get.offAllNamed(signupRoute,
              arguments: {'arg_customer': argCustomer});
        } else {
          Get.offAllNamed(dashboardRoute);
        }
      } else {
        bumacoSnackbar(
          'login'.tr,
          'Incorrect password, please try again!',
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

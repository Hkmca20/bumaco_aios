import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupController extends GetxController {
  late TextEditingController nameCTR, emailCTR, mobileCTR, dobCTR;
  late String profilePhoto;
  final box = GetStorage(BOX_APP);
  var genderGroupValue = ''.obs;
  var nameUpdated = ''.obs;

  @override
  void onInit() {
    super.onInit();
    nameCTR = TextEditingController();
    emailCTR = TextEditingController();
    mobileCTR = TextEditingController();
    dobCTR = TextEditingController();

    profilePhoto = getStorageStringValue(BOX_PROFILE_PHOTO);
    if (profilePhoto == '')
      profilePhoto =
          'https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769';
    nameCTR.text = getStorageStringValue(BOX_NAME).toString().toUpperCase();
    emailCTR.text = getStorageStringValue(BOX_EMAIL);
    mobileCTR.text = getStorageStringValue(BOX_MOBILE);
    dobCTR.text = getStorageStringValue(BOX_DOB);
    genderGroupValue.value = getStorageStringValue(BOX_GENDER);
    nameUpdated(nameCTR.text);
  }

  @override
  void onClose() {
    nameCTR.dispose();
    emailCTR.dispose();
    mobileCTR.dispose();
    dobCTR.dispose();
    super.onClose();
  }

  submitButton(context) async {
    if (genderGroupValue.value == '') {
      VxToast.show(context, msg: 'Please select your gender');
    } else if (nameCTR.text.length < 2) {
      VxToast.show(context, msg: 'Please enter your Full name');
    } else if (emailCTR.text.length < 2) {
      VxToast.show(context, msg: 'Please enter your Email id');
      // } else if (Consta emailCTR.text.length < 2) {//to do emeil matcher
      //   VxToast.show(context, msg: 'Please enter your Email id');
    } else if (mobileCTR.text.length < 2) {
      VxToast.show(context, msg: 'Please enter your mobile num');
    } else {
      box.write(BOX_NAME, nameCTR.text);
      box.write(BOX_EMAIL, emailCTR.text);
      box.write(BOX_DOB, dobCTR.text);
      box.write(BOX_GENDER, genderGroupValue.value);

      showLoadingDialog();
      bumacoSnackbar('alert'.tr, 'Profile updated successfully!');
      Future.delayed(500.milliseconds);
      Get.offAllNamed(dashboardRoute);
    }
  }

  void submitLaterButton(context) {
    if (nameCTR.text.length < 2) {
      VxToast.show(context, msg: 'Full name required to proceed');
    } else {
      box.write(BOX_NAME, nameCTR.text);
      bumacoSnackbar('alert'.tr, 'Welcome!');
      showLoadingDialog();
      Future.delayed(500.milliseconds);
      Get.offAllNamed(dashboardRoute);
    }
  }
}

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/login_repo.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupController extends GetxController {
  late TextEditingController nameCTR,
      emailCTR,
      mobileCTR,
      passwordCTR,
      confirmPassCTR;
  late String profilePhoto;
  final box = GetStorage(BOX_APP);
  var genderGroupValue = ''.obs;
  var nameUpdated = ''.obs;
  late LoginRepo _loginRepo;
  late final LoginData? argCustomer;

  @override
  void onInit() {
    super.onInit();
    argCustomer = Get.arguments['arg_customer'];
    _loginRepo = Get.find<LoginRepoImpl>();
    nameCTR = TextEditingController();
    emailCTR = TextEditingController();
    mobileCTR = TextEditingController();
    passwordCTR = TextEditingController();
    confirmPassCTR = TextEditingController();

    profilePhoto = getStorageStringValue(BOX_PROFILE_PHOTO);
    if (profilePhoto == '')
      profilePhoto =
          'https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769';
    nameCTR.text = getStorageStringValue(BOX_NAME).toString().toUpperCase();
    emailCTR.text = getStorageStringValue(BOX_EMAIL);
    mobileCTR.text = getStorageStringValue(BOX_MOBILE);
    passwordCTR.text = getStorageStringValue(BOX_PASSWORD);
    confirmPassCTR.text = getStorageStringValue(BOX_PASSWORD);
    genderGroupValue.value = getStorageStringValue(BOX_GENDER);
    nameUpdated(nameCTR.text);
  }

  @override
  void onClose() {
    nameCTR.dispose();
    emailCTR.dispose();
    mobileCTR.dispose();
    passwordCTR.dispose();
    confirmPassCTR.dispose();
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
    } else if (passwordCTR.text.length < 5) {
      VxToast.show(context, msg: 'Please set your password');
    } else if (passwordCTR.text != confirmPassCTR.text) {
      VxToast.show(context,
          msg: 'Password and confirm password are not matched');
    } else {
      box.write(BOX_NAME, nameCTR.text);
      box.write(BOX_EMAIL, emailCTR.text);
      box.write(BOX_PASSWORD, passwordCTR.text);
      box.write(BOX_GENDER, genderGroupValue.value);

      showLoadingDialog();
      LoginData loginData = LoginData(
        id: getStorageStringValue(BOX_CUSTOMER_ID),
        name: nameCTR.text,
        // phone: mobileCTR.text,
        email: emailCTR.text,
        password: passwordCTR.text,
        createDate: DateTime.now(),
        modifiDate: DateTime.now(),
      );
      var response = await _loginRepo.updateProfile(loginData);
      hideLoadingDialog();
      if (response) {
        VxToast.show(context, msg: 'Profile updated successfully!');
      } else {
        VxToast.show(context, msg: 'Failed to update profile!');
      }
      Get.offAllNamed(dashboardRoute);
    }
  }

  void submitLaterButton(context) async {
    if (nameCTR.text.length < 2) {
      VxToast.show(context, msg: 'Full name required to proceed');
    } else {
      box.write(BOX_NAME, nameCTR.text);
      bumacoSnackbar('alert'.tr, 'Welcome! ${nameCTR.text}');
      showLoadingDialog();
      var response = await _loginRepo.updateProfile(argCustomer!);
      if (response) {
        VxToast.show(context, msg: 'Profile updated successfully!');
      } else {
        VxToast.show(context, msg: 'Failed to update profile!');
      }
      Get.offAllNamed(dashboardRoute);
    }
  }
}

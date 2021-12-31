import 'package:bumaco_aios/app_core/models/login_data.dart';
import 'package:bumaco_aios/app_core/repository/login_repo.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find(tag: PROFILE_CONTROLLER);
  late TextEditingController nameCTR,
      emailCTR,
      mobileCTR,
      passwordCTR,
      confirmPassCTR; // dobCTR;
  late String profilePhoto;
  final box = GetStorage(BOX_APP);
  var genderGroupValue = ''.obs;
  DateTime? _currDatetime = DateTime.now();
  late LoginRepo _loginRepo;

  var nameUpdated = ''.obs;

  @override
  void onInit() {
    super.onInit();
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
    if (nameCTR.text == '') nameCTR.text = 'Guest User';
    emailCTR.text = getStorageStringValue(BOX_EMAIL);
    mobileCTR.text = getStorageStringValue(BOX_MOBILE);
    passwordCTR.text = getStorageStringValue(BOX_PASSWORD);
    // dobCTR.text = getStorageStringValue(BOX_DOB);
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

  // openDatePicker(context) {
  //   showDatePicker(
  //     context: context,
  //     helpText: 'Select Date of Birth',
  //     initialDate: _currDatetime ?? DateTime.now(),
  //     firstDate: DateTime(1970),
  //     lastDate: DateTime(2025),
  //   ).then((value) {
  //     if (value == null) {
  //       bumacoToast(context, 'Cancelled');
  //       return;
  //     }
  //     _currDatetime = value;
  //     dobCTR.text = _currDatetime.toString();
  //   });
  // }

  submitButton(context) async {
    if (genderGroupValue.value == '') {
      VxToast.show(context, msg: 'Please select your gender');
    } else if (nameCTR.text.length < 2) {
      VxToast.show(context, msg: 'Please enter your Full name');
    } else if (mobileCTR.text.length < 2) {
      VxToast.show(context, msg: 'Please enter your mobile number');
    } else if (!GetUtils.isNumericOnly(mobileCTR.text)) {
      VxToast.show(context, msg: 'Please enter correct mobile number');
    } else if (emailCTR.text.length < 2) {
      VxToast.show(context, msg: 'Please enter your Email id');
    } else if (!GetUtils.isEmail(emailCTR.text)) {
      VxToast.show(context, msg: 'Please enter correct Email id');
    } else if (passwordCTR.text.length < 2) {
      VxToast.show(context, msg: 'Please set your password');
    } else if (passwordCTR.text != confirmPassCTR.text) {
      VxToast.show(context,
          msg: 'Password and confirm password are not matched');
    } else {
      box.write(BOX_NAME, nameCTR.text);
      box.write(BOX_MOBILE, mobileCTR.text);
      box.write(BOX_EMAIL, emailCTR.text);
      box.write(BOX_PASSWORD, passwordCTR.text);
      box.write(BOX_GENDER, genderGroupValue.value);

      LoginData loginData = LoginData(
        id: getStorageStringValue(BOX_CUSTOMER_ID),
        name: nameCTR.text,
        phone: mobileCTR.text,
        email: emailCTR.text,
        password: passwordCTR.text,
        createDate: DateTime.now(),
        modifiDate: DateTime.now(),
      );
      showLoadingDialog();
      final response = await _loginRepo.updateProfile(loginData);
      hideLoadingDialog();
      if (response) {
        VxToast.show(context, msg: 'Profile updated successfully!');
        Get.back();
      } else {
        VxToast.show(context, msg: 'Failed to update!');
      }
    }
  }

  void showCameraPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        // _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      // _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}

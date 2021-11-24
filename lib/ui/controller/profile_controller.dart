import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find(tag: PROFILE_CONTROLLER);
  late TextEditingController nameCTR, emailCTR, mobileCTR, dobCTR;
  late String profilePhoto;
  final box = GetStorage(BOX_APP);
  var genderGroupValue = ''.obs;
  DateTime? _currDatetime = DateTime.now();

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
    if (nameCTR.text == '') nameCTR.text = 'Guest User';
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

  openDatePicker(context) {
    showDatePicker(
      context: context,
      helpText: 'Select Date of Birth',
      initialDate: _currDatetime ?? DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value == null) {
        bumacoToast(context, 'Cancelled');
        return;
      }
      _currDatetime = value;
      dobCTR.text = _currDatetime.toString();
    });
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
    } else if (dobCTR.text.length < 2) {
      VxToast.show(context, msg: 'Please select your Date of birth');
    } else {
      box.write(BOX_NAME, nameCTR.text);
      box.write(BOX_MOBILE, mobileCTR.text);
      box.write(BOX_EMAIL, emailCTR.text);
      box.write(BOX_DOB, dobCTR.text);
      box.write(BOX_GENDER, genderGroupValue.value);
      bumacoSnackbar('alert'.tr, 'Profile updated successfully!');
      await Future.delayed(500.milliseconds);
      Get.back();
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

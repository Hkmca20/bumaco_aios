import 'dart:async';

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninController extends GetxController {
  static SigninController get to => Get.find(tag: LOGIN_CONTROLLER);
  late TextEditingController mobileCTR;
  RxBool isLoggedIn = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;

  @override
  void onInit() {
    print('onInit==========>');
    mobileCTR = TextEditingController();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      _currentUser = account;
      // box.write(BOX_GOOGLE_ID, _currentUser!.id);
      Get.back();
      print('Current user --------------->'); //print id here
      print(_currentUser);

      // getStorage.write(BOX_IS_LOGGEDIN, true);
      // Get.offAllNamed(dashboardRoute);
    });
    _googleSignIn.signInSilently();
    super.onInit();
  }

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
    showLoadingDialog();
    await Future.delayed(Duration(seconds: 3));
    try {
      Get.back();
      if (mobileCTR.text == '9999999999') {
        // Get.toNamed(otpRoute, arguments: 'OTP has been sent to ${mobileCTR.text}');
        bumacoSnackbar('Login', 'OTP sent successfully on ${mobileCTR.text}');
        box.write(BOX_MOBILE, mobileCTR.text);
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

  void googleSignInMethod(context) async {
    GoogleSignInAccount? googleUser = _currentUser;
    if (googleUser != null) {
      //   print('user.displayName=========> ${googleUser.displayName}');
      //   print('user.email=========>${googleUser.email}');
      //   print('user.ID=========>${googleUser.id}');
      //   print('user.photoUrl=========>${googleUser.photoUrl}');
      handleSignOut(context);
    } else {
      showLoadingDialog();
      _handleSignIn(context);
    }
  }

  Future<void> _handleSignIn(context) async {
    try {
      print('handle --------signin');
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;
      await _auth.signInWithCredential(credential).then((profile) {
        print(
            'handle --------signInWithCredential------${profile.user!.phoneNumber}');
        print(
            'handle --------signInWithCredential------${profile.user!.email}');

        box.write(BOX_NAME, profile.user!.displayName);
        box.write(BOX_EMAIL, profile.user!.email);
        // if (profile.user!.phoneNumber!.isNotEmpty) {
        //   box.write(BOX_MOBILE,profile.user!.phoneNumber);
        // }
        box.write(BOX_PROFILE_PHOTO, profile.user!.photoURL);
        getStorage.write(BOX_IS_LOGGEDIN, true);
        Get.offAllNamed(dashboardRoute);

        // saveUser(user);
        // Get.offAll(HomeView());
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> handleSignOut(context) => _googleSignIn.disconnect();

  void facebookSignInMethod() async {
    // final AccessToken result = await FacebookAuth.instance.login();

    //   final FacebookAuthCredential facebookAuthCredential =
    //       FacebookAuthProvider.credential(result.token);

    //   await _auth.signInWithCredential(facebookAuthCredential).then((user) {
    //     saveUser(user);
    //   });
  }
}

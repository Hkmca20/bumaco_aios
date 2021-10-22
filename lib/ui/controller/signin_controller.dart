import 'dart:async';
import 'dart:convert' show json;

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class SigninController extends GetxController {
  static SigninController get to => Get.find(tag: LOGIN_CONTROLLER);
  final mobileCTR = TextEditingController();
  RxBool isLoggedIn = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;

  @override
  void onInit() {
    print('onInit==========>');
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      _currentUser = account;
      print('Current user --------------->');
      print(_currentUser);
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

  void googleSignInMethod() async {
    // GoogleSignInAccount? googleUser = _currentUser;
    // if (googleUser != null) {
    //   print('user.displayName=========> ${googleUser.displayName}');
    //   print('user.email=========>${googleUser.email}');
    //   print('user.ID=========>${googleUser.id}');
    //   print('user.photoUrl=========>${googleUser.photoUrl}');
    //   _handleSignOut();
    // } else {
    _handleSignIn();
    // _handleSignOut();
    // }
    // print(googleUser);
  }

  Future<void> _handleSignIn() async {
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

        // saveUser(user);
        // Get.offAll(HomeView());
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  void facebookSignInMethod() async {
    // final AccessToken result = await FacebookAuth.instance.login();

    //   final FacebookAuthCredential facebookAuthCredential =
    //       FacebookAuthProvider.credential(result.token);

    //   await _auth.signInWithCredential(facebookAuthCredential).then((user) {
    //     saveUser(user);
    //   });
  }
}

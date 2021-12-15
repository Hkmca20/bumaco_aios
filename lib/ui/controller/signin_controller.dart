import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:bumaco_aios/app_config/app_environment.dart';
import 'package:bumaco_aios/app_core/models/login_model.dart';
import 'package:bumaco_aios/app_core/repository/repository.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/login/login_json.dart';
import 'package:bumaco_aios/ui/login/widgets/custom_button_social.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:velocity_x/velocity_x.dart';

class SigninController extends GetxController {
  static SigninController get to => Get.find(tag: LOGIN_CONTROLLER);
  late TextEditingController mobileEmailCTR;
  RxBool isLoggedIn = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;

  late LoginRepo _loginRepo;

  @override
  void onInit() {
    _loginRepo = Get.find<LoginRepoImpl>();
    mobileEmailCTR = TextEditingController();
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
    mobileEmailCTR.clear();
    mobileEmailCTR.dispose();
  }

  bool isEmail(String email) => patternEmail.hasMatch(email);

  bool isMobile(String mobile) => patternMobile.hasMatch(mobile);

  final box = GetStorage(BOX_APP);
  
  saveLoginMobileOrEmail(isMobileNum, value) {
    if (isMobileNum) {
      box.write(BOX_MOBILE, value);
    } else {
      box.write(BOX_EMAIL, value);
    }
  }

  submitSignIn() async {
    if (mobileEmailCTR.text.length == 0) {
      bumacoSnackbar('Error', 'Please enter Mobile number/ Email id');
      return;
    }
    if (mobileEmailCTR.text.length < 5) {
      bumacoSnackbar('Error', 'Invalid Mobile number/ email id');
      return;
    }
    if (!isEmail(mobileEmailCTR.text) && !isMobile(mobileEmailCTR.text)) {
      bumacoSnackbar('Error', 'Please enter a valid email id or mobile number');
      return;
    }
    bool isLoginWithMobileNumber = false;
    if (isMobile(mobileEmailCTR.text)) {
      isLoginWithMobileNumber = true;
    }
    showLoadingDialog();
    final result = await _loginRepo.checkLogin(
        isLoginWithMobileNumber, mobileEmailCTR.text);
    try {
      Get.back();
      if (result != null && result.status) {
        bumacoSnackbar('login'.tr, result.message);
        saveLoginMobileOrEmail(isLoginWithMobileNumber, mobileEmailCTR.text);
        if (result.loginData.password == null ||
            result.loginData.password!.length < 4) {
          Get.toNamed(otpRoute, arguments: {'arg_customer': result.loginData});
        } else {
          Get.toNamed(passRoute, arguments: {'arg_customer': result.loginData});
        }
      } else if (result != null && !result.status) {
        bumacoSnackbar('login'.tr, result.message);
        saveLoginMobileOrEmail(isLoginWithMobileNumber, mobileEmailCTR.text);
        Get.toNamed(otpRoute, arguments: {'arg_customer': result.loginData});
      }
      // else if (mobileCTR.text == '9999999999') {
      //   // Get.toNamed(otpRoute, arguments: 'OTP has been sent to ${mobileCTR.text}');
      //   bumacoSnackbar(
      //       'login'.tr, 'OTP sent successfully on ${mobileCTR.text}');
      //   box.write(BOX_MOBILE, mobileCTR.text);
      //   Get.toNamed(otpRoute);
      // }
      else {
        bumacoSnackbar('login'.tr, 'Failed, please try again!');
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

  void loginPopupBottomSheet(context) {
    showModalBottomSheet(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          // BorderRadius.circular(15.0),
        ),
        context: context,
        builder: (context) {
          return VStack([
            VxDivider(
              color: kGreyLightColor,
              width: 3,
              indent: 150,
              endIndent: 150,
            ).p8(),
            SizedBox(height: 10),
            'Login or Register to proceed'
                .text
                .fontWeight(FontWeight.w600)
                .size(16)
                .make()
                .p20(),
            VStack([
              loginButton(context),
              SizedBox(height: 10),
              googleButton(context),
              SizedBox(height: 10),
              // facebookButton(context),
            ]),
          ]);
        });
  }

  loginButton(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        color: kTransparentColor,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
              blurRadius: 5, color: kPrimaryLightColor, offset: Offset(1, 3))
        ],
      ),
      child: ElevatedButton(
        child: 'signin_with_email_or_mobile'.tr.text.make().p4(),
        onPressed: () {
          Get.back();
          Get.toNamed(signinRoute);
        },
      ),
    ).centered();
  }

  googleButton(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      decoration: BoxDecoration(
          color: kTransparentColor,
          borderRadius: BorderRadius.circular(1),
          border: Border.all(
            color: kGreyLightColor,
            width: 0.5,
          )),
      child: CustomButtonSocial(
        text: 'signin_with_google'.tr,
        onPress: () {
          Get.back();
          googleSignInMethod(context);
        },
        imageName: iconGoogle,
      ),
    );
  }

  facebookButton(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
          border: Border.all(
        color: kGreyLightColor,
        width: 0.5,
      )),
      child: CustomButtonSocial(
        text: 'signin_with_facebook'.tr,
        onPress: () {
          bumacoSnackbar('alert'.tr, 'Working');
          facebookSignInMethod();
        },
        imageName: iconFacebook,
      ),
    );
  }
}

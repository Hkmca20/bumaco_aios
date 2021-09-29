import 'dart:async';
import 'dart:convert' show json;

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:bumaco_aios/ui/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class SigninController extends GetxController {
  static SigninController get to => Get.find(tag: LOGIN_CONTROLLER);
  final mobileCTR = TextEditingController();
  RxBool isLoggedIn = false.obs;
  Rx<UserModel> userModel = UserModel().obs;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    clientId:
        '758677051271-ul2anqh5ln0j8862lss57f00109o8oqf.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  GoogleSignInAccount? _currentUser;

  @override
  void onInit() {
    print('onInit==========>');
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      _currentUser = account;
      print('Current user --------------->');
      print(_currentUser);

      if (_currentUser != null) {
        _handleGetContact(_currentUser!);
      }
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
    showLoading();
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
    GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      print('user.displayName=========> ${user.displayName}');
      print('user.email=========>${user.email}');
      _handleGetContact(user);
    } else {
      _handleSignIn();
      // _handleSignOut();
    }
    // final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    // print(googleUser);
    // GoogleSignInAuthentication googleSignInAuthentication =
    //     await googleUser.authentication;

    // final AuthCredential credential = GoogleAuthProvider.credential(
    //   idToken: googleSignInAuthentication.idToken,
    //   accessToken: googleSignInAuthentication.accessToken,
    // );

    // await _auth.signInWithCredential(credential).then((user) {
    //   saveUser(user);
    //   Get.offAll(HomeView());
    // });
  }

  String _contactText = '';
  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    _contactText = "Loading contact info...";
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      _contactText = "People API gave a ${response.statusCode} "
          "response. Check logs for details.";
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String? namedContact = _pickFirstNamedContact(data);
    if (namedContact != null) {
      _contactText = "I see you know $namedContact!";
    } else {
      _contactText = "No contacts to display.";
    }
    print(_contactText);
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'];
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> _handleSignIn() async {
    try {
      print('handle --------signin');
      // await _googleSignIn.signIn();

      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // AuthResult authResult = await _auth.signInWithCredential(credential);

      // FirebaseUser _user = authResult.user;

      // assert(!_user.isAnonymous);

      // assert(await _user.getIdToken() != null);

      // FirebaseUser currentUser = await _auth.currentUser();

      // assert(_user.uid == currentUser.uid);

      // print("User Name: ${_user.displayName}");
      // print("User Email ${_user.email}");
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

  RxString selectedCountry = 'English (UK)'.obs;
  final List locale = [
    {'name': '●	Egypt'.tr, 'locale': Locale('ar', 'EG')},
    {'name': '●	UK'.tr, 'locale': Locale('en', 'UK')},
    {'name': '●	KSA'.tr, 'locale': Locale('ar', 'KS')},
    {'name': '●	Qatar'.tr, 'locale': Locale('ar', 'QA')},
    {'name': '●	UAE'.tr, 'locale': Locale('ar', 'UA')},
    {'name': '●	Bahrain'.tr, 'locale': Locale('ar', 'BR')},
    {'name': '●	Oman '.tr, 'locale': Locale('ar', 'OM')},
    {'name': '●	Kuwait'.tr, 'locale': Locale('ar', 'KU')},
  ];
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) => AlertDialog(
              title: Text('Choose Country'),
              content: Container(
                width: double.maxFinite,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.all(8),
                        child: GestureDetector(
                            onTap: () {
                              print(locale[index]['name'] + ' selected');
                              updateLanguage(locale[index]['locale']);
                              selectedCountry.value = locale[index]['name'];
                            },
                            child: Text(locale[index]['name']))),
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.blue,
                        ),
                    itemCount: locale.length),
              ),
            ));
  }
}

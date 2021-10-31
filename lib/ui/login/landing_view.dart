import 'dart:ui';
import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/login/widgets/auth_widget.dart';
import 'package:bumaco_aios/ui/views/home/banners/cbanner_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingView extends StatelessWidget {
  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'HINDI', 'locale': Locale('hi', 'IN')},
  ];
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) => AlertDialog(
              title: Text('Choose a Language'),
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
                            },
                            child: Text(locale[index]['name']))),
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.blue,
                        ),
                    itemCount: locale.length),
              ),
            ));
  }

  createGetxDialog() {
    Get.defaultDialog(
      title: 'Select a Language',
      middleText: "You content goes here...",
      content: getContent(),
      barrierDismissible: false,
      radius: 4.0,
      confirm: confirmBtn(),
      cancel: cancelBtn(),
    );
  }

  Widget getContent() {
    return Column(
      children: [
        Text("Your content goes here widget"),
        Text("Your content goes here widget"),
        Text("Your content goes here widget"),
        Text("Your content goes here widget"),
      ],
    );
  }

  Widget confirmBtn() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("Confirm"));
  }

  Widget cancelBtn() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("Cancel"));
  }

  final signinController = SigninController.to;
  final bannerController = BannerController.to;
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        textDirection: TextDirection.rtl,
        fit: StackFit.loose,
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            height: _screenSize.height,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(bg4),
            )),
            // color: Colors.blue,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(
                  // the size where the blurring starts
                  height: _screenSize.height * 0.4,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned(
            width: _screenSize.width,
            top: 70,
            child: Column(
              children: [
                Text(
                  'app_title'.tr,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: kWhiteColor,
                  ),
                ),
                Text(
                  'Your Beauty. Our Passion',
                  style: TextStyle(
                    fontSize: 11,
                    color: kWhiteColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 150,
              child: CBannerHomeWidget(
                bannerHeight: _screenSize.height / 3,
                fitImage: BoxFit.fill,
                bannerList: [
                  BannerModel(
                      image:
                          'https://i.ibb.co/YtRkZBH/Whats-App-Image-2021-10-23-at-10-17-32-PM.jpg'),
                  BannerModel(
                      image:
                          'https://i.ibb.co/JyXz8nT/Whats-App-Image-2021-10-23-at-10-16-53-PM.jpg'),
                  BannerModel(
                      image:
                          'https://i.ibb.co/xYh55kS/Whats-App-Image-2021-10-23-at-10-16-18-PM.jpg'),
                ],
                // bannerController.bannerPositionList[12].bannerlist,
              )),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 0,
            child: SingleChildScrollView(
              child: Card(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                shadowColor: Colors.white10.withOpacity(0.1),
                elevation: 5,
                color: Colors.black12.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Obx(
                        () => bannerController.isLoading.isTrue
                            ? LoadingWidget()
                            : CBannerHomeWidget(
                                bannerHeight: _screenSize.width / 5,
                                fitImage: BoxFit.fill,
                                autoscroll: true,
                                bannerList: bannerController
                                    .bannerPositionList[8].bannerlist,
                              ),
                      ),
                      SizedBox(height: 40),
                      loginText,
                      loginButton(context),
                      googleButton(context),
                      // facebookButton(context),
                      skipLabel(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // Scaffold(
    //   appBar: AppBar(
    //     title: Text('Login'),
    //   ),
    //   body: Container(
    //     child: Center(
    //       child: Column(
    //         children: [
    //           Text('message'.tr),
    //           ElevatedButton(
    //               onPressed: () => {
    //                     // Get.defaultDialog(
    //                     //     title: 'Welcome to coding program',
    //                     //     middleText: 'xxxxxxxxxxxx'),
    //                     // buildDialog(context),
    //                     // createGetxDialog(),
    //                     Get.toNamed(otpRoute),
    //                   },
    //               child: Text('Submit OTP')),
    //           ElevatedButton.icon(
    //             onPressed: () => {Get.toNamed(profileRoute2)},
    //             icon: Icon(Icons.mail),
    //             label: Text('Profile'),
    //           ),
    //           ExpansionView(),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  var loginText = Text(
    'login'.tr + ' ' + 'or'.tr + ' ' + 'register'.tr,
    style: TextStyle(fontSize: 20, color: kWhiteColor),
  );

  loginButton(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      width: MediaQuery.of(context).size.width - 40,
      child: ElevatedButton(
        child: Text('signin_with_email_or_mobile'.tr),
        onPressed: () {
          Get.toNamed(loginRoute);
        },
      ),
    );
  }

  googleButton(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: CustomButtonSocial(
        text: 'signin_with_google'.tr,
        onPress: () {
          signinController.googleSignInMethod(context);
        },
        imageName: iconGoogle,
      ),
    );
  }

  facebookButton(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: CustomButtonSocial(
        text: 'signin_with_facebook'.tr,
        onPress: () {
          bumacoSnackbar('alert'.tr, 'Working');
          signinController.facebookSignInMethod();
        },
        imageName: iconFacebook,
      ),
    );
  }

  skipLabel(context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        child: Text(
          'skip_and_continue'.tr,
          style: TextStyle(color: kWhiteColor, fontSize: 22),
        ),
      ),
      onTap: () => {
        getStorage.write(BOX_IS_LOGGEDIN, true),
        Get.offAllNamed(dashboardRoute),
      },
    );
  }
}

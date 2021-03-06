import 'dart:ui';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/login/widgets/auth_widget.dart';
import 'package:bumaco_aios/ui/views/home/banners/cbanner_gate.dart';
import 'package:bumaco_aios/ui/views/home/banners/cbanner_one.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

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
  final lController = LocaleController.to;
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
            width: _screenSize.width / 2 - 5,
            top: 35,
            right: 0,
            child: VStack(
              [
                15.heightBox,
                'Country (??????)'.tr.text.xl.bold.center.white.make(),
                Obx(
                  () => ('' +
                          lController.selectedCountry.value.tr +
                          ' - ' +
                          lController.selectedCurrency.value.tr +
                          ' ( ' +
                          lController.selectedSymbol.value.tr +
                          ' )' +
                          ' - ' +
                          lController.selectedLanguage.value.tr)
                      .text
                      .sm
                      .center
                      .white
                      .make(),
                ),
              ],
              alignment: MainAxisAlignment.spaceBetween,
              crossAlignment: CrossAxisAlignment.stretch,
            ).onTap(() {
              lController.openLocaleSheet(context);
            }),
          ),
          Positioned(
            width: _screenSize.width / 2 + 5,
            top: 40,
            left: 0,
            child: Column(
              children: [
                HStack(
                  [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                      width: 50, height: 50,
                      child: Image.asset(
                        logo100Path,
                        color: kWhiteColor,
                      ).p2(),
                      // logo100Path.circularAssetImage().p8(),
                    ),
                    VStack([
                      'app_title'.tr.text.xl3.bold.white.make(),
                      'app_tagline'
                          .tr
                          .text
                          .xs
                          .ellipsis
                          .white
                          .maxLines(2)
                          .make(),
                    ]),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 110,
            child: CBannerGateWidget(
              bannerHeight: _screenSize.height / 3 - 10,
              fitImage: BoxFit.cover,
              bannerList: bannerController.landingBannerList,
              // bannerController.bannerPositionList[12].bannerlist,
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 0,
            child: SingleChildScrollView(
              child: Card(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                shadowColor: Colors.white10.withOpacity(0.1),
                elevation: 4,
                color: Colors.black12.withOpacity(0.1),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
                  child: Column(
                    children: [
                      Obx(
                        () => bannerController.isLoading.isTrue
                            ? LoadingWidget()
                            : CBannerOneWidget(
                                bannerHeight: _screenSize.width / 5,
                                fitImage: BoxFit.fill,
                                autoscroll: true,
                                bannerList: bannerController
                                    .bannerPositionList[8].bannerlist,
                              ),
                      ),
                      SizedBox(height: 20),
                      loginText(),
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

  loginText() =>
      ('login'.tr + ' ' + 'or'.tr + ' ' + 'register'.tr).text.white.xl2.make();

  loginButton(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      width: MediaQuery.of(context).size.width - 40,
      child: ElevatedButton(
        child: 'signin_with_email_or_mobile'.tr.text.xl.make(),
        onPressed: () {
          Get.toNamed(signinRoute);
        },
      ),
    );
  }

  googleButton(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        border: Border.all(
          color: kGreyLightColor,
          width: 0.5,
        ),
      ),
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        border: Border.all(
          color: kGreyLightColor,
          width: 0.5,
        ),
      ),
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
        child: 'skip_and_continue'.tr.text.white.xl2.make(),
      ),
      onTap: () => {
        getStorage.write(BOX_TEMP_LOGGEDIN, true),
        Get.offAllNamed(dashboardRoute),
      },
    );
  }
}

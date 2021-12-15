import 'dart:ui';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/login/widgets/auth_widget.dart';
import 'package:bumaco_aios/ui/views/home/banners/cbanner_gate.dart';
import 'package:bumaco_aios/ui/views/home/banners/cbanner_one.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';

class GateView extends StatelessWidget {
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
              image: AssetImage(img_splash),
            )),
            // color: Colors.blue,
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: ClipRect(
          //     child: BackdropFilter(
          //       filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          //       child: Container(
          //         // the size where the blurring starts
          //         height: _screenSize.height * 0.4,
          //         color: Colors.transparent,
          //       ),
          //     ),
          //   ),
          // ),
          Positioned(
            width: _screenSize.width,
            top: 70,
            child: Column(
              children: [
                HStack(
                  [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                      width: 60, height: 60,
                      child: Image.asset(
                        logo100Path,
                        color: kWhiteColor,
                      ).p4(),
                      // logo100Path.circularAssetImage().p8(),
                    ),
                    VStack([
                      'app_title'.tr.text.xl4.bold.white.make(),
                      'app_tagline'.tr.text.xs.white.make(),
                    ]),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 150,
            height: _screenSize.height - 150,
            child: GridView.builder(
              padding: EdgeInsets.all(50),
              shrinkWrap: true,
              itemCount: bannerController.landingGateList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 28.0,
                mainAxisSpacing: 28.0,
              ),
              itemBuilder: (context, index) {
                final item = bannerController.landingGateList[index];
                return InkWell(
                  onTap: () {
                    GetStorage(BOX_APP)
                        .write(BOX_GATE_SELECTED, item.bannertext);
                    Get.toNamed(landingRoute);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kWhiteColor.withOpacity(0.5),
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: kWhiteColor),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(3),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: kWhiteColor.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 5,
                            style: BorderStyle.solid,
                            color: kWhiteColor),
                      ),
                      child: item.bannertext.text.bold.lg.black.center
                          .makeCentered()
                          .p4(),
                    ),
                  ),
                );
              },
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
}

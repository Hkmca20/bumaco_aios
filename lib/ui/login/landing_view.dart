import 'dart:ui';
import 'package:bumaco_aios/app_utils/const.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        textDirection: TextDirection.rtl,
        fit: StackFit.loose,
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(bg3),
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
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 150,
            child: Text(
              "Bumaco,\nOnline Shop to \nyour doorstep",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 20,
            child: Card(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              shadowColor: Colors.white54,
              elevation: 5,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    loginText,
                    loginButton(context),
                    googleButton(context),
                    skipLabel(context),
                  ],
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
    'Bumaco Login',
    style: TextStyle(fontSize: 24, color: Colors.black),
  );

  loginButton(context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        child: Text('Sign-In'),
        onPressed: () {
          Get.toNamed(loginRoute);
        },
      ),
    );
  }

  googleButton(context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: ElevatedButton(
        child: Text('SignIn with Google'),
        onPressed: () {},
      ),
    );
  }

  skipLabel(context) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: GestureDetector(
        child: Text(
          'Skip and Continue',
          style: TextStyle(fontSize: 20),
        ),
        onTap: () => {
          getStorage.write(BOX_IS_LOGGEDIN, true),
          Get.offAllNamed(shoppingRoute),
        },
      ),
    );
  }
}

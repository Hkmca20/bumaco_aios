import 'package:bumaco_aios/ui/login/expension_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
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
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text('hello'.tr),
              ElevatedButton(
                  onPressed: () => {
                        // Get.snackbar('title xxxxxx', 'message yyyyyy'),
                        // Get.defaultDialog(
                        //     title: 'Welcome to coding program',
                        //     middleText: 'xxxxxxxxxxxx'),
                        // buildDialog(context),
                        // createGetxDialog(),
                        Get.toNamed('/otp'),
                      },
                  child: Text('Submit OTP')),
              ElevatedButton.icon(
                onPressed: () => {
                  Get.toNamed('/profile'),
                },
                icon: Icon(
                  Icons.mail,
                  color: Colors.white,
                  size: 24,
                ),
                label: Text(
                  'ProfileView',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
              ExpansionView(),
            ],
          ),
        ),
      ),
    );
  }
}

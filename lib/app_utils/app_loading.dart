import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

showLoading() {
  Get.defaultDialog(
    backgroundColor: kWhiteColor,
      title: '',
      content: Positioned.fill(
        child: Column(
          children: [
            Text('Loading, Please wait..'),
            SizedBox(height: 20),
            LoadingWidget(),
            SizedBox(height: 20),
          ],
        ),
      ),
      barrierDismissible: false);
}

hideLoading() {
  Get.back();
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // CupertinoActivityIndicator(),
        CircularProgressIndicator(
          color: kPrimaryColor,
        )
      ],
    );
  }
}

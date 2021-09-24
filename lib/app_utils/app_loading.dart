import 'package:bumaco_aios/app_utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoading() {
  Get.defaultDialog(
      title: '',
      content: Column(
        children: [
          Text('Loading, Please wait..'),
          SizedBox(height: 20),
          LoadingWidget(),
          SizedBox(height: 20),
        ],
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
        CircularProgressIndicator(
          color: kPrimaryColor,
          // size: 30,
        )
      ],
    );
  }
}

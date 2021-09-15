import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoading() {
  Get.defaultDialog(
      title: "Loading...",
      content: CircularProgressIndicator(),
      barrierDismissible: false);
}

dismissLoadingWidget() {
  Get.back();
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: CircularProgressIndicator(
          color: Colors.black,
          // size: 30,
        ));
  }
}

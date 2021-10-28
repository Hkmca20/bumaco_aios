import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

showLoadingDialog() {
  Get.defaultDialog(
      title: '',
      backgroundColor: Vx.white.withOpacity(0.2),
      content: Positioned.fill(
        child: Column(
          children: [
            Text('loading_please_wait'.tr + '..'),
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
        Center(
          child: CircularProgressIndicator(
            color: kPrimaryColor,
          ),
        )
      ],
    );
  }
}

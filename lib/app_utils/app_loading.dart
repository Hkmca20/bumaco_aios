import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

showLoadingDialog() {
  Get.defaultDialog(
    title: 'app_title'.tr,
    // backgroundColor: kTransparentColor,
    content: Container(
      // decoration:
      //     BoxDecoration(border: Border.symmetric(horizontal: BorderSide.none)),
      width: 130,
      height: 150,
      child: VStack(
        [
          ('loading_please_wait'.tr + '..').text.sm.make().centered(),
          SizedBox(height: 20),
          LoadingWidget(),
          SizedBox(height: 10),
        ],
        crossAlignment: CrossAxisAlignment.center,
        alignment: MainAxisAlignment.center,
      ),
    ),
    barrierDismissible: false,
  );
}

hideLoadingDialog() {
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
          child: Lottie.asset(loadingDottedRingLottie, height: 100, width: 100),
          // CircularProgressIndicator(
          //     color: kPrimaryColor,
          //   ),
        )
      ],
    );
  }
}

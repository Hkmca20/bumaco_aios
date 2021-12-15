import 'dart:ui';

import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class PasswordView extends StatelessWidget {
  const PasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _passController = PassController.to;
    // bumacoSnackbar('Login', Get.arguments.toString());

    var submitButton = ElevatedButton(
            onPressed: () => {
                  _passController.submitPassword(),
                },
            child: 'submit'.tr.text.xl.make().centered()
            // child: Ink(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(colors: [Colors.teal, Colors.cyan]),
            //   ),
            //   child: Container(
            //     padding: const EdgeInsets.all(10),
            //     constraints: const BoxConstraints(minWidth: 88.0),
            //     child: const Text('Submit', textAlign: TextAlign.center),
            //   ),
            // ),
            )
        .marginSymmetric(horizontal: 30);

    var otpInputText = Container(
      margin: EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
      // child: VxPinView(
      //   radius: 1,
      //   type: VxPinBorderType.round,
      //   size: 40,
      //   space: 10,
      //   obscureText: false,
      //   // onSubmitted: _otpController.submitOTP(),
      //   keyboardType: TextInputType.number,
      //   fill: true,
      //   // textInputAction: _otpController.submitOTP(),
      //   color: kTransparentColor,
      //   // contentColor: kBlackColor,
      //   count: 5,
      //   onChanged: (value) {
      //     _otpController.updateOtp(value);
      //   },
      // ),
      child: TextFormField(
        style: TextStyle(
          letterSpacing: 6,
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),
        controller: _passController.passCTR,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.password_rounded,
            color: kWhiteColor,
          ),
          labelText: 'password'.tr,
          border: OutlineInputBorder(),
        ),
        maxLines: 1,
        minLines: 1,
        keyboardType: TextInputType.number,
        autofocus: false,
      ),
    );

    var resendOtpLabel = GestureDetector(
      onTap: () {
        Get.toNamed(otpRoute,
            arguments: {'arg_customer': _passController.argCustomer});
      },
      child: 'Login with OTP'.text.xl.italic.make(),
    );

    return Scaffold(
      // backgroundColor: kScafoldDarkBGColor,
      resizeToAvoidBottomInset: false,
      appBar: AppbarHome(title: 'password'.tr),
      body: Container(
        margin: EdgeInsets.all(20),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     fit: BoxFit.fill,
        //     image: AssetImage(bg3),
        //   ),
        //   borderRadius: BorderRadius.all(Radius.circular(40.0)),
        // ),
        child: Column(
          children: [
            SizedBox(height: 10),
            AppLogoWidget(),
            otpInputText,
            SizedBox(height: 32),
            Obx(
              () => Visibility(
                  visible: _passController.isLoading.isFalse,
                  child: submitButton),
            ),
            SizedBox(height: 32),
            resendOtpLabel,
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

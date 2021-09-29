import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPView extends StatelessWidget {
  const OTPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _otpController = OTPController.to;
    // bumacoSnackbar('Login', Get.arguments.toString());

    var submitButton = ElevatedButton(
      onPressed: () => {
        _otpController.submitOTP(),
      },
      child: const Text('Submit', textAlign: TextAlign.center),
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
    );

    var otpInputText = Container(
      margin: EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
      child: TextFormField(
        style: TextStyle(color: kWhiteColor, fontSize: 22),
        controller: _otpController.otpCTR,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.password_rounded,
            color: kWhiteColor,
          ),
          labelText: 'OTP',
          border: OutlineInputBorder(),
        ),
        maxLines: 1,
        minLines: 1,
        keyboardType: TextInputType.number,
        autofocus: false,
      ),
    );

    var resendOtpLabel = Obx(() => GestureDetector(
          onTap: () {
            if (_otpController.canResendOTP.value) {
              Get.snackbar('OTP', 'Resending otp..');
            } else {
              Get.snackbar('OTP',
                  'Please wait for ${_otpController.initialValue} senconds');
            }
          },
          child: Text(
            _otpController.resendText.value,
            style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
          ),
        ));

    return Scaffold(
      backgroundColor: kScafoldDarkBGColor,
      resizeToAvoidBottomInset: false,
      appBar: BumacoAppbar(title: 'OTP'),
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
            submitButton,
            SizedBox(height: 32),
            resendOtpLabel,
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

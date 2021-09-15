import 'package:bumaco_aios/app_utils/app_bar.dart';
import 'package:bumaco_aios/ui/controller/otp_controller.dart';
import 'package:bumaco_aios/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPView extends StatelessWidget {
  const OTPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _otpController = OTPController.to;

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
        controller: _otpController.otpCTR,
        decoration: InputDecoration(
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
            style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
          ),
        ));

    return Scaffold(
      appBar: MyAppBar('OTP', []),
      body: Container(
        margin: EdgeInsets.only(
          top: 50,
        ),
        child: Column(
          children: [
            AppLogoWidget(),
            otpInputText,
            SizedBox(height: 32),
            submitButton,
            SizedBox(height: 32),
            resendOtpLabel,
          ],
        ),
      ),
    );
  }
}

import 'package:bumaco_aios/ui/login/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPView extends StatelessWidget {
  const OTPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _otpController = OTPController.to;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.timer_rounded),
            SizedBox(height: 32),
            Obx(
              () => Visibility(
                visible: !_otpController.canResendOTP.value,
                child: Text(
                  _otpController.initialValue.toString(),
                  style: TextStyle(fontSize: 72),
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: _otpController.canResendOTP.value,
                child: ElevatedButton(
                  onPressed: () => {Get.toNamed('/shopping')},
                  child: Text('GOTO Home'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

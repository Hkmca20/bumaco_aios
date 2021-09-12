import 'dart:async';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get to => Get.find(tag: '_otp_controller');
  var initialValue = 3.obs;
  var canResendOTP = false.obs;

  @override
  void onInit() {
    Timer.periodic(
        Duration(seconds: 1),
        (t) => {
              initialValue--,
              print('timer_running..'),
              if (initialValue <= 0)
                {
                  t.cancel(),
                  canResendOTP.value = true,
                }
            });
    super.onInit();
  }
}

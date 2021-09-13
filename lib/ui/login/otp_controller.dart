import 'dart:async';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get to => Get.find(tag: OTP_CONTROLLER);
  var initialValue = 3.obs;
  var canResendOTP = false.obs;

  @override
  void onInit() {
    Timer.periodic(
        Duration(seconds: 1),
        (t) => {
              initialValue--,
              if (initialValue <= 0)
                {
                  t.cancel(),
                  canResendOTP.value = true,
                }
            });
    super.onInit();
  }
}

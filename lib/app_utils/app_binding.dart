import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/login/language_controller.dart';
import 'package:bumaco_aios/ui/login/otp_controller.dart';
import 'package:bumaco_aios/ui/login/splash_controller.dart';
import 'package:bumaco_aios/ui/onboard/controller/onboard_controller.dart';
import 'package:bumaco_aios/ui/shopping/controller/cart_controller.dart';
import 'package:bumaco_aios/ui/shopping/controller/shopping_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OTPController(), fenix: true, tag: OTP_CONTROLLER);
    Get.lazyPut(() => LanguageController(), fenix: true, tag: LOCALE_CONTROLLER);
    Get.lazyPut(() => SplashController(), fenix: true, tag: SPLASH_CONTROLLER);
    Get.lazyPut(() => OnboardController(), fenix: true, tag: ONBOARD_CONTROLLER);
    Get.lazyPut(() => ShoppingController(), fenix: true, tag: SHOPPING_CONTROLLER);
    Get.lazyPut(() => CartController(), fenix: true, tag: CART_CONTROLLER);
    // Get.put<OnboardingController>(OnboardingController());
    // Get.put<Controller2>(Controller2());
  }
}

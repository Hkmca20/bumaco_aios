import 'package:bumaco_aios/ui/login/otp_controller.dart';
import 'package:bumaco_aios/ui/onboard/controller/onboard_controller.dart';
import 'package:bumaco_aios/ui/shopping/controller/cart_controller.dart';
import 'package:bumaco_aios/ui/shopping/controller/shopping_controller.dart';
import 'package:get/get.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
  Get.lazyPut(() => OTPController(), fenix: true, tag: '_otp_controller');
  Get.lazyPut(() => OnboardingController(), fenix: true, tag: '_onboard_controller');
  Get.lazyPut(() => ShoppingController(), fenix: true, tag: '_shopping_controller');
  Get.lazyPut(() => CartController(), fenix: true, tag: '_cart_controller');
    // Get.put<OnboardingController>(OnboardingController());
    // Get.put<Controller2>(Controller2());
  }
}
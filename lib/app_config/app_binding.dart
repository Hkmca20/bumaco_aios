import 'package:bumaco_aios/app_core/repository/banner_repo.dart';
import 'package:bumaco_aios/app_core/repository/news_repo_impl.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/controller/banner_controller.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/controller/locale_controller.dart';
import 'package:bumaco_aios/ui/controller/signin_controller.dart';
import 'package:bumaco_aios/ui/controller/otp_controller.dart';
import 'package:bumaco_aios/ui/controller/splash_controller.dart';
import 'package:bumaco_aios/ui/news/news_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SigninController(), fenix: true, tag: LOGIN_CONTROLLER);
    Get.lazyPut(() => OTPController(), fenix: true, tag: OTP_CONTROLLER);
    Get.lazyPut(() => LocaleController(), fenix: true, tag: LOCALE_CONTROLLER);
    Get.lazyPut(() => SplashController(), fenix: true, tag: SPLASH_CONTROLLER);
    Get.lazyPut(() => OnboardController(),
        fenix: true, tag: ONBOARD_CONTROLLER);
    Get.lazyPut(() => ShoppingController(),
        fenix: true, tag: SHOPPING_CONTROLLER);
    Get.lazyPut(() => CartController(), fenix: true, tag: CART_CONTROLLER);
    // Get.put<OnboardingController>(OnboardingController());
    // Get.put<Controller2>(Controller2());

    ///Other binding class
    ///
    // Get.lazyPut(() => LoginController(repository: LoginRepo()), fenix: true);//exm
    // Get.lazyPut(() => HomeController(HomeRepo()), fenix: true);//exm hari
    Get.lazyPut(() => ProductController(),
        fenix: true, tag: PRODUCT_CONTROLLER);
    Get.lazyPut(() => BucketController(), fenix: true, tag: BUCKET_CONTROLLER);
    Get.lazyPut(() => AddressController(),
        fenix: true, tag: ADDRESS_CONTROLLER);
    Get.lazyPut(() => BannerController(), fenix: true, tag: BANNER_CONTROLLER);
    Get.lazyPut(() => ProductMakeupController(), fenix: true);
    Get.lazyPut(() => NewsController(), fenix: true);
    Get.lazyPut(() => NewsRepoImpl(), fenix: true);

    Get.lazyPut(() => CategoryController(),
        fenix: true, tag: CATEGORY_CONTROLLER);
    Get.lazyPut(() => ChildCategoryController(),
        fenix: true, tag: C_CATEGORY_CONTROLLER);
    Get.lazyPut(() => SubCategoryController(),
        fenix: true, tag: S_CATEGORY_CONTROLLER);
        
    Get.lazyPut(() => BannerRepoImpl(), fenix: true);
  }
}

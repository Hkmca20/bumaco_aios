import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/dummy/settings_view.dart';
import 'package:bumaco_aios/ui/login/landing_view.dart';
import 'package:bumaco_aios/ui/login/login_view.dart';
import 'package:bumaco_aios/ui/login/otp_view.dart';
import 'package:bumaco_aios/ui/login/profile_ui_view.dart';
import 'package:bumaco_aios/ui/login/profile_view.dart';
import 'package:bumaco_aios/ui/login/splash_view.dart';
import 'package:bumaco_aios/ui/onboard/onboard_page.dart';
import 'package:bumaco_aios/ui/shopping/shopping_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> get setRoute => [
      GetPage(
        name: initialRoute,
        page: () => SplashView(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 1000),
        bindings: [],
      ),
      GetPage(
          name: onboardRoute,
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 1000),
          page: () => OnboardingPage()),
      GetPage(
          name: landingRoute,
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 1000),
          page: () => LandingView()),
      GetPage(
          name: loginRoute,
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 1000),
          page: () => LoginView()),
      GetPage(
          name: profileRoute,
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 1000),
          page: () => ProfileView()),
      GetPage(
          name: profileRoute2,
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 1000),
          page: () => ProfileUI2()),
      GetPage(
          name: otpRoute,
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 1000),
          page: () => OTPView()),
      GetPage(
          name: shoppingRoute,
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 1000),
          page: () => ShoppingPage()),
      GetPage(
          name: settingRoute,
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 1000),
          page: () => SettingView()),
    ];

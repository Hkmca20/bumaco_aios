import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/dummy/settings_view.dart';
import 'package:bumaco_aios/ui/login/login_page.dart';
import 'package:bumaco_aios/ui/login/otp_view.dart';
import 'package:bumaco_aios/ui/login/profileUI2.dart';
import 'package:bumaco_aios/ui/login/profile_view.dart';
import 'package:bumaco_aios/ui/login/splash_view.dart';
import 'package:bumaco_aios/ui/onboard/view/onboard_page.dart';
import 'package:bumaco_aios/ui/shopping/view/shopping_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> get setRoute => [
      GetPage(name: initialRoute, page: () => SplashPage(), bindings: []),
      GetPage(name: onboardRoute, page: () => OnboardingPage()),
      GetPage(name: loginRoute, page: () => LoginPage()),
      GetPage(name: profileRoute, page: () => ProfileView()),
      GetPage(name: profileRoute2, page: () => ProfileUI2()),
      GetPage(name: otpRoute, page: () => OTPView()),
      GetPage(name: shoppingRoute, page: () => ShoppingPage()),
      GetPage(name: settingRoute, page: () => SettingView()),
    ];

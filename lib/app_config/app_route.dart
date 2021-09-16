import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/dummy/settings_view.dart';
import 'package:bumaco_aios/ui/login/profile_ui_view.dart';
import 'package:bumaco_aios/ui/onboard/onboard_page.dart';
import 'package:bumaco_aios/ui/shopping/product_detail.dart';
import 'package:bumaco_aios/ui/shopping/shopping_page.dart';
import 'package:bumaco_aios/ui/views.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

const kTransitionDuration = Duration(milliseconds: 500);
List<GetPage<dynamic>> get setRoute => [
      GetPage(
        name: initialRoute,
        page: () => SplashView(),
        transition: Transition.fade,
        transitionDuration: kTransitionDuration,
        bindings: [],
      ),
      GetPage(
          name: onboardRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => OnboardingPage()),
      GetPage(
          name: landingRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => LandingView()),
      GetPage(
          name: loginRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => LoginView()),
      GetPage(
          name: profileRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => ProfileView()),
      GetPage(
          name: profileRoute2,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => ProfileUI2()),
      GetPage(
          name: otpRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => OTPView()),
      GetPage(
          name: shoppingRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => ShoppingPage()),
      GetPage(
          name: catalogRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => CatalogView()),
      GetPage(
          name: productDetailRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => ProductDetailView()),
      GetPage(
          name: settingRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => SettingView()),
    ];

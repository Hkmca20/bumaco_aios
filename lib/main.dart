import 'package:bumaco_aios/app_config/app_binding.dart';
import 'package:bumaco_aios/app_config/app_locale.dart';
import 'package:bumaco_aios/app_config/app_theme.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_config/app_route.dart';
import 'package:bumaco_aios/ui/controller/settings_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  print('background message ${message.notification!.body}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);

  await GetStorage.init(BOX_APP);
  Get.lazyPut(() => SettingsController(),
      fenix: true, tag: SETTINGS_CONTROLLER);
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _settingsController = SettingsController.to;
  @override
  Widget build(BuildContext context) {
    // var lang = Localizations.localeOf(context).languageCode;
    return GetMaterialApp(
      enableLog: false,
      defaultTransition: Transition.native,
      transitionDuration: Duration(milliseconds: 250),
      title: appName,
      debugShowCheckedModeBanner: false,
      themeMode: _settingsController.themeMode,
      // themeMode: ThemeMode.system,
      theme: setTheme(context),
      darkTheme: setDarkTheme(context),
      translations: BumacoLocale(),
      locale: localeList[0], //default locale from get device locale
      fallbackLocale: localeList[0], //fallback if locale not present in device
      initialRoute: initialRoute,
      // onGenerateRoute: (RouteSettings settings) {
      //   if (settings.name.contains('onboard')) {
      //     return CustomRoute<bool>(
      //         builder: (BuildContext context) => ProductDetailPage());
      //   } else {
      //     return CustomRoute<bool>(
      //         builder: (BuildContext context) => MainPage());
      //   }
      // },
      initialBinding: AppBinding(),
      getPages: setRoute,
    );
  }
}

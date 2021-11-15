import 'dart:io';
import 'package:bumaco_aios/app_core/db/database/app_database.dart';
import 'package:bumaco_aios/network/dio_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app_config/config.dart';
import 'app_utils/utils.dart';
import 'network/dio_client_impl.dart';
import 'ui/controller/controllers.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  print('background message ${message.notification!.body}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);

  await GetStorage.init(BOX_APP);
  // Get.lazyPut(() => SettingsController(),
  //     fenix: true, tag: SETTINGS_CONTROLLER);
  Get.lazyPut(() => LocaleController(), fenix: true, tag: LOCALE_CONTROLLER);

  await Get.putAsync<DioClient>(() => DioClientImpl().init());
  await Get.putAsync<AppDatabase>(() => AppDatabase.init());

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final settingsController = SettingsController.to;
  final lController = LocaleController.to;
  @override
  Widget build(BuildContext context) {
    // var lang = Localizations.localeOf(context).languageCode;
    // print(Platform.operatingSystem);
    // print(Platform.operatingSystemVersion);
    // print(Platform.version);
    // PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    //   String appName = packageInfo.appName;
    //   String packageName = packageInfo.packageName;
    //   String version = packageInfo.version;
    //   String buildNumber = packageInfo.buildNumber;
    // });
    // print(Get.deviceLocale); // deviceCurrentLocale
    // print(Get.locale); // appCurrentLocale

    return GetMaterialApp(
      enableLog: true,
      defaultTransition: Transition.native,
      transitionDuration: Duration(milliseconds: 250),
      title: appNameEN,
      debugShowCheckedModeBanner: false,
      // themeMode: _settingsController.themeMode,
      themeMode: ThemeMode.system,
      theme: setTheme(context),
      darkTheme: setDarkTheme(context),
      translations: BumacoLocale(),
      locale: lController.setLocale(),
      fallbackLocale: ukLocale,
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

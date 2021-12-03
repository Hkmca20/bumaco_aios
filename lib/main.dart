import 'dart:async';

import 'package:bumaco_aios/app_core/db/database/app_database.dart';
import 'package:bumaco_aios/network/dio_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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

final firebaseConfig = const FirebaseOptions(
  // apiKey: 'AIzaSyAbFSdOllMd0mw3JICK9AIqM3RH9K-39-0',
  apiKey: 'AIzaSyBjA5X_1RfRWdjP88Ri3hmLfIp1qyo9F_Y',
  appId: '1:758677051271:android:d2436d6b3591fa1b41e522',
  messagingSenderId: '758677051271',
  authDomain: 'bumaco-2021.firebaseapp.com',
  projectId: 'bumaco-2021',
);
Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init(BOX_APP);
    try {
      // await Firebase.initializeApp();
      await Firebase.initializeApp(options: firebaseConfig);
    } on Exception catch (e, s) {
      print('error: $e');
      print('stack: $s');
    }
    FirebaseMessaging.onBackgroundMessage(_messageHandler);
    String? token = await FirebaseMessaging.instance.getToken();
    putStorageValue(BOX_FCM_TOKEN, token);

    // Get.lazyPut(() => SettingsController(),
    //     fenix: true, tag: SETTINGS_CONTROLLER);
    Get.lazyPut(() => LocaleController(), fenix: true, tag: LOCALE_CONTROLLER);

    await Get.putAsync<DioClient>(() => DioClientImpl().init());
    await Get.putAsync<AppDatabase>(() => AppDatabase.init());
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    return runApp(MyApp());
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
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

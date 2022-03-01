import 'dart:async';

import 'package:bumaco_aios/app_config/app_environment.dart';
import 'package:bumaco_aios/app_core/db/database/app_database.dart';
import 'package:bumaco_aios/network/dio_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app_config/config.dart';
import 'app_utils/utils.dart';
import 'network/dio_client_impl.dart';
import 'ui/controller/controllers.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  print('background message ${message.notification!.body}');
}

final firebaseConfig = FirebaseOptions(
  apiKey: AppEnvironment.apiKey,
  appId: AppEnvironment.appIdA,
  messagingSenderId: AppEnvironment.messagingSenderId,
  authDomain: AppEnvironment.authDomain,
  projectId: AppEnvironment.projectId,
);
double deviceScale = 1.0;
setDeviceScaler(context) {
  final mSize = MediaQuery.of(context).size;
  double deviceHeightInPoints = (mSize.height / mSize.aspectRatio);
  if (deviceHeightInPoints < 700.0) {
    deviceScale = 0.90;
  }
  if (deviceHeightInPoints < 600.0) {
    deviceScale = 0.80;
  }
  print('Device scale: ' + deviceScale.toString());
}

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init(BOX_APP);
    try {
      await Firebase.initializeApp();
      // await Firebase.initializeApp(options: firebaseConfig);
    } on Exception catch (e) {
      debugPrint('error: $e');
    }
    try {
      FirebaseMessaging.onBackgroundMessage(_messageHandler);
      String? token = await FirebaseMessaging.instance.getToken();
      putStorageValue(BOX_FCM_TOKEN, token);
      debugPrint('----Token=>$token');
    } on Exception catch (e) {
      debugPrint('error: $e');
    }
    await dotenv.load(fileName: AppEnvironment.fileName);
    await Future.delayed(Duration.zero, () {
      // setDeviceScaler(context);
    });
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
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey();
  // final settingsController = SettingsController.to;
  final lController = LocaleController.to;
  @override
  Widget build(BuildContext context) {
    // var lang = Localizations.localeOf(context).languageCode;

    // get the global context as follows
    // _scaffoldMessengerKey.currentState.showSnackBar(....);
    // ScaffoldMessenger.of(context).showSnackBar(....);
    return GetMaterialApp(
      scaffoldMessengerKey: _scaffoldMessengerKey,
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

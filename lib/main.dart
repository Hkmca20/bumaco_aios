import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/app_locale.dart';
import 'package:bumaco_aios/app_utils/theme.dart';
import 'package:bumaco_aios/ui/controller_binding.dart';
import 'package:bumaco_aios/ui/login/otp_view.dart';
import 'package:bumaco_aios/ui/login/profileUI2.dart';
import 'package:bumaco_aios/ui/login/profile_view.dart';
import 'package:bumaco_aios/ui/onboard/view/onboard_page.dart';
import 'package:bumaco_aios/ui/setting_page.dart';
import 'package:bumaco_aios/ui/login/login_page.dart';
import 'package:bumaco_aios/ui/shopping/view/shopping_page.dart';
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

  await GetStorage.init(PREF_APP);
  return runApp(MyApp());
}
/*
* GetStorage _storage = GetStorage('MyStorage');
    or
final _storage = GetStorage();
_storage.write(key, value); //write
_storage.read(key); //Read
_storage.remove(Key); //particular or single key remove
_storage.erase(); //container remove.
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var lang = Localizations.localeOf(context).languageCode;
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: setTheme(context),
      translations: BumacoLocale(), // my translation
      locale: localeList[0], //default locale from get device locale
      fallbackLocale: localeList[0], //fallback if locale not present in device
      initialRoute: initialRoute,
      initialBinding: ControllerBinding(),
      getPages: [
        GetPage(name: initialRoute, page: () => OnboardingPage(), bindings: []),
        GetPage(name: loginRoute, page: () => LoginPage()),
        GetPage(name: profileRoute, page: () => ProfileView()),
        GetPage(name: profileRoute2, page: () => ProfileUI2()),
        GetPage(name: otpRoute, page: () => OTPView()),
        GetPage(name: shoppingRoute, page: () => ShoppingPage()),
        GetPage(name: settingRoute, page: () => SettingPage()),
      ],
      // home: OnboardingPage(),
    );
  }
}

import 'package:bumaco_aios/app/theme.dart';
import 'package:bumaco_aios/ui/controller_binding.dart';
import 'package:bumaco_aios/ui/login/otp_view.dart';
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

  await GetStorage.init('bumaco_storage');
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
      title: 'Bumaco',
      debugShowCheckedModeBanner: false,
      theme: setTheme(context),
      translations: LocalString(), // my translation
      locale: Locale('en', 'US'), //default locale from get device locale
      fallbackLocale:
          Locale('en', 'US'), //fallback if locale not present in device
      initialRoute: "/",
      initialBinding: ControllerBinding(),
      getPages: [
        GetPage(name: "/", page: () => OnboardingPage(), bindings: []),
        GetPage(name: "/login", page: () => LoginPage()),
        GetPage(name: "/profile", page: () => ProfileView()),
        GetPage(name: "/otp", page: () => OTPView()),
        GetPage(name: "/shopping", page: () => ShoppingPage()),
        GetPage(name: "/setting", page: () => SettingPage()),
      ],
      // home: OnboardingPage(),
    );
  }
}

class LocalString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hellow World',
          'message': 'Hi How are you, Welcome to Bumaco'
        },
        'hi_IN': {
          'hello': 'Namaste',
          'message': 'Hello app kaise hai, Bumaco me apka swagat hai'
        },
      };
}

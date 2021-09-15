import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  static LocaleController get to => Get.find(tag: LOCALE_CONTROLLER);
  
  void changeLanguage(var param1, var param2) {
    var locale = Locale(param1, param1);
    Get.updateLocale(locale);
  }
}

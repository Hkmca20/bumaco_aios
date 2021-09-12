import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  
  void changeLanguage(var param1, var param2) {
    var locale = Locale(param1, param1);
    Get.updateLocale(locale);
  }
}

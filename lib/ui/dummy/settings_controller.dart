import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find(tag: SETTINGS_CONTROLLER);
  final box = GetStorage(BOX_APP);

// Theme Settings:
  bool get isDarkTheme => box.read(BOX_IS_DARK) ?? false;
  ThemeData get theme => isDarkTheme ? ThemeData.dark() : ThemeData.light();
  Brightness get brightness => isDarkTheme ? Brightness.dark : Brightness.light;
  void changeTheme(val) => {
    print('--------changing dark---------$val'),
        box.write(BOX_IS_DARK, val),
        val
            ? Get.changeTheme(ThemeData.dark())
            : Get.changeTheme(ThemeData.light())
      };

// Notification Settings:
  bool get isNotification => box.read(BOX_IS_NOTIFICATION) ?? true;
  void changeNotification(value) => box.write(BOX_IS_NOTIFICATION, value);

}

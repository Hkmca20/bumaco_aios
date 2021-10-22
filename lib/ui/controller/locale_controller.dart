import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  static LocaleController get to => Get.find(tag: LOCALE_CONTROLLER);

  void changeLanguage(var param1, var param2) {
    var locale = Locale(param1, param1);
    Get.updateLocale(locale);
  }

  RxString selectedCountry = 'English (UK)'.obs;
  final List locale = [
    {'name': 'egypt'.tr, 'locale': Locale('ar', 'AE')},
    {'name': 'UK', 'locale': Locale('en', 'UK')},
    {'name': 'ksa'.tr, 'locale': Locale('ar', 'AE')},
    {'name': 'quatar'.tr, 'locale': Locale('ar', 'AE')},
    {'name': 'uae'.tr, 'locale': Locale('ar', 'AE')},
    {'name': 'bahrain'.tr, 'locale': Locale('ar', 'AE')},
    {'name': 'oman'.tr, 'locale': Locale('ar', 'AE')},
    {'name': 'kuwait'.tr, 'locale': Locale('ar', 'AE')},
    {'name': 'germany'.tr, 'locale': Locale('en', 'UK')},
    {'name': 'france'.tr, 'locale': Locale('en', 'UK')},
  ];
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) => AlertDialog(
              title: Text('choose_country'.tr),
              content: Container(
                width: double.maxFinite,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.all(8),
                        child: GestureDetector(
                            onTap: () {
                              print(locale[index]['name'] + ' selected');
                              updateLanguage(locale[index]['locale']);
                              selectedCountry.value = locale[index]['name'];
                            },
                            child: Text(locale[index]['name']))),
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.blue,
                        ),
                    itemCount: locale.length),
              ),
            ));
  }
}

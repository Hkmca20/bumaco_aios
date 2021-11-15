import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  static LocaleController get to => Get.find(tag: LOCALE_CONTROLLER);

  void changeLanguage(var param1, var param2) {
    var locale = Locale(param1, param1);
    Get.updateLocale(locale);
  }

  RxString selectedCountry = ''.obs;
  RxString selectedCurrency = ''.obs;
  final box = GetStorage(BOX_APP);
  @override
  void onInit() {
    super.onInit();
    print(
        '-----------currency contry-----1------${getStorageStringValue(BOX_COUNTRY)}');
    selectedCountry.value = getStorageStringValue(BOX_COUNTRY) == ''
        ? 'English (UK)'
        : getStorageStringValue(BOX_COUNTRY);
    selectedCurrency.value = getStorageStringValue(BOX_CURRENCY) == ''
        ? 'USD'
        : getStorageStringValue(BOX_CURRENCY);
    localeList.forEach((element) {
      if (element['currency'] == selectedCurrency) {}
    });
  }

  final List localeList = [
    {
      'sno': '1',
      'name': 'egypt'.tr,
      'locale': Locale('ar', 'AE'),
      'language': 'arabic'.tr,
      'currency': 'EGP',
      'currency_symbol': '£',
      'selected': false,
    },
    {
      'sno': '2',
      'name': 'UK',
      'locale': Locale('en', 'UK'),
      'language': 'english'.tr,
      'currency': 'GBP',
      'currency_symbol': '£',
      'selected': false,
    },
    {
      'sno': '3',
      'name': 'ksa'.tr,
      'locale': Locale('ar', 'AE'),
      'language': 'arabic'.tr,
      'currency': 'SAR',
      'currency_symbol': '﷼',
      'selected': false,
    },
    {
      'sno': '4',
      'name': 'quatar'.tr,
      'locale': Locale('ar', 'AE'),
      'language': 'arabic'.tr,
      'currency': 'QAR',
      'currency_symbol': '﷼',
      'selected': false,
    },
    {
      'sno': '5',
      'name': 'uae'.tr,
      'locale': Locale('ar', 'AE'),
      'language': 'arabic'.tr,
      'currency': 'AED',
      'currency_symbol': 'د.إ',
      'selected': false,
    },
    {
      'sno': '6',
      'name': 'bahrain'.tr,
      'locale': Locale('ar', 'AE'),
      'language': 'arabic'.tr,
      'currency': 'BHD',
      'currency_symbol': '.د.ب',
      'selected': false,
    },
    {
      'sno': '7',
      'name': 'oman'.tr,
      'locale': Locale('ar', 'AE'),
      'language': 'arabic'.tr,
      'currency': 'OMR',
      'currency_symbol': '﷼',
      'selected': false,
    },
    {
      'sno': '8',
      'name': 'kuwait'.tr,
      'locale': Locale('ar', 'AE'),
      'language': 'arabic'.tr,
      'currency': 'KWD',
      'currency_symbol': 'د.ك',
      'selected': false,
    },
    {
      'sno': '9',
      'name': 'germany'.tr,
      'locale': Locale('en', 'UK'),
      'language': 'english'.tr,
      'currency': 'EUR',
      'currency_symbol': '€',
      'selected': false,
    },
    {
      'sno': '10',
      'name': 'france'.tr,
      'locale': Locale('en', 'UK'),
      'language': 'english'.tr,
      'currency': 'EUR',
      'currency_symbol': '€',
      'selected': false,
    },
  ];

  updateCountryInfo(int index) {
    Get.updateLocale(localeList[index]['locale']);

    selectedCurrency.value = localeList[index]['currency'];
    selectedCountry.value = localeList[index]['name'];
    box.write(BOX_COUNTRY, localeList[index]['name']);
    box.write(BOX_CURRENCY, localeList[index]['currency']);
    box.write(BOX_CURRENCY_SYMBOL, localeList[index]['currency_symbol']);
    print(getStorageStringValue(BOX_CURRENCY) + '-');
  }

  void openLocaleSheet(context) {
    showModalBottomSheet(
        context: context,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          // BorderRadius.circular(15.0),
        ),
        builder: (context) {
          return VStack([
            VxDivider(
              color: kGreyLightColor,
              width: 3,
              indent: 150,
              endIndent: 150,
            ).p8(),
            'choose_country'.tr.text.bold.size(24).make().p8(),
            VxDivider(),
            // HStack([
            //   'S.No.  Country Name'
            //       .text
            //       .size(16)
            //       .fontWeight(FontWeight.w100)
            //       .make()
            //       .p16()
            //       .expand(),
            //   'Currency'
            //       .text
            //       .size(16)
            //       .fontWeight(FontWeight.w100)
            //       .make()
            //       .p16()
            //       .expand(),
            // ]),
            Container(
              padding: EdgeInsets.all(8),
              height: 400,
              alignment: Alignment.center,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: localeList.length,
                  separatorBuilder: (context, int) {
                    return Divider(
                      indent: 10,
                      endIndent: 20,
                      height: 1,
                    );
                  },
                  itemBuilder: (context, index) {
                    return InkWell(
                        child: HStack([
                          '${localeList[index]['name']}'
                              .text
                              .red500
                              .size(18)
                              .fontWeight(FontWeight.w300)
                              .make()
                              .p16()
                              .expand(),
                          '${localeList[index]['currency']}'
                              .text
                              .align(TextAlign.end)
                              .size(16)
                              .fontWeight(FontWeight.w300)
                              .make()
                              .p16()
                              .expand(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: kGreyLightColor,
                          ),
                        ]),
                        onTap: () {
                          updateCountryInfo(index);
                          Get.back();
                        });
                  }),
            ),
          ]);
        });
  }

  setLocale() {
    Locale currentLocale = Get.deviceLocale ?? ukLocale;
    localeList.forEach((element) {
      if (element['currency'] == getStorageStringValue(BOX_CURRENCY)) {
        currentLocale = element['locale'];
      }
    });
    return currentLocale;
  }
}

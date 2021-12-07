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
  RxString selectedLanguage = ''.obs;
  RxString selectedCurrency = ''.obs;
  RxString selectedSymbol = ''.obs;
  final box = GetStorage(BOX_APP);
  @override
  void onInit() {
    super.onInit();
    selectedCountry.value = getStorageStringValue(BOX_COUNTRY) == ''
        ? 'English (UK)'
        : getStorageStringValue(BOX_COUNTRY);
    selectedCurrency.value = getStorageStringValue(BOX_CURRENCY);
    if (selectedCurrency.value == '') {
      updateCountryInfo(1);
    } else
      localeList.forEach((element) {
        if (element['currency'] == selectedCurrency.value) {
          selectedSymbol.value = element['currency_symbol'];
          selectedLanguage.value = element['language'];
        }
      });
  }

  final List localeList = [
    {
      'sno': '1',
      'name': 'egypt',
      'locale': Locale('ar', 'AE'),
      'language': 'arabic',
      'currency': 'EGP',
      'currency_symbol': '£',
      'selected': false,
    },
    {
      'sno': '2',
      'name': 'UK',
      'locale': Locale('en', 'UK'),
      'language': 'english',
      'currency': 'GBP',
      'currency_symbol': '£',
      'selected': false,
    },
    {
      'sno': '3',
      'name': 'ksa',
      'locale': Locale('ar', 'AE'),
      'language': 'arabic',
      'currency': 'SAR',
      'currency_symbol': '﷼',
      'selected': false,
    },
    {
      'sno': '4',
      'name': 'quatar',
      'locale': Locale('ar', 'AE'),
      'language': 'arabic',
      'currency': 'QAR',
      'currency_symbol': '﷼',
      'selected': false,
    },
    {
      'sno': '5',
      'name': 'uae',
      'locale': Locale('ar', 'AE'),
      'language': 'arabic',
      'currency': 'AED',
      'currency_symbol': 'د.إ',
      'selected': false,
    },
    {
      'sno': '6',
      'name': 'bahrain',
      'locale': Locale('ar', 'AE'),
      'language': 'arabic',
      'currency': 'BHD',
      'currency_symbol': '.د.ب',
      'selected': false,
    },
    {
      'sno': '7',
      'name': 'oman',
      'locale': Locale('ar', 'AE'),
      'language': 'arabic',
      'currency': 'OMR',
      'currency_symbol': '﷼',
      'selected': false,
    },
    {
      'sno': '8',
      'name': 'kuwait',
      'locale': Locale('ar', 'AE'),
      'language': 'arabic',
      'currency': 'KWD',
      'currency_symbol': 'د.ك',
      'selected': false,
    },
    {
      'sno': '9',
      'name': 'GERMANY',
      'locale': Locale('en', 'UK'),
      'language': 'english',
      'currency': 'EUR',
      'currency_symbol': '€',
      'selected': false,
    },
    {
      'sno': '10',
      'name': 'FRANCE',
      'locale': Locale('en', 'UK'),
      'language': 'english',
      'currency': 'EUR',
      'currency_symbol': '€',
      'selected': false,
    },
  ];

  updateCountryInfo(int index) {
    Get.updateLocale(localeList[index]['locale']);

    selectedCurrency.value = localeList[index]['currency'];
    selectedCountry.value = localeList[index]['name'];
    selectedLanguage.value = localeList[index]['language'];
    selectedSymbol.value = localeList[index]['currency_symbol'];
    box.write(BOX_COUNTRY, localeList[index]['name']);
    box.write(BOX_CURRENCY, localeList[index]['currency']);
    box.write(BOX_CURRENCY_SYMBOL, localeList[index]['currency_symbol']);
  }

  void openLocaleSheet(context) {
    final _screenSize = MediaQuery.of(context).size;
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
            'choose_country'.tr.text.bold.size(22).make().p8(),
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
              height: _screenSize.height / 3 + 40,
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
                              .tr
                              .text
                              .bold
                              .color(kPrimaryColor)
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
                          '${localeList[index]['currency_symbol']}'
                              .text
                              .align(TextAlign.end)
                              .size(16)
                              .fontWeight(FontWeight.w300)
                              .make()
                              .p16(),
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

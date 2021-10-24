import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find(tag: HOME_CONTROLLER);
  late ScrollController scrollController = ScrollController();
  var offset = 0.0;
  var showFAB = true.obs;
  @override
  void onInit() {
    addScrollListener();
    super.onInit();
  }

  @override
  void onClose() {
    // _timer.cancel();
    scrollController.removeListener(() {
      print('home scrollControl removed');
    });
    super.onClose();
  }

  addScrollListener() {
    scrollController.addListener(() {
      offset = scrollController.offset;
      if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        showFAB.value = true;
        print(showFAB.value);
      } else {
        if (showFAB.isTrue) {
          showFAB.value = false;
          print(showFAB.value);
        }
      }
    });
  }

  RxString selectedCountry = 'BEAUTY GATE'.obs;
  final List locale = [
    {'name': 'BEAUTY GATE'.toUpperCase(), 'locale': 'ID1'},
    {'name': 'FASHION GATE'.toUpperCase(), 'locale': 'ID2'},
    {'name': 'Antiques gate'.toUpperCase(), 'locale': 'ID1'},
    {'name': 'Modern Arts gate'.toUpperCase(), 'locale': 'ID1'},
    {'name': 'Altaras & Sport gate'.toUpperCase(), 'locale': 'ID1'},
    {'name': 'Stars & Fans gate'.toUpperCase(), 'locale': 'ID1'},
    {'name': 'Pets gate'.toUpperCase(), 'locale': 'ID1'},
    {'name': 'Bikes & Moto gate'.toUpperCase(), 'locale': 'ID1'},
    {'name': 'Rent & Shared Assents gate'.toUpperCase(), 'locale': 'ID1'},
  ];

  buildDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) => AlertDialog(
              title: Text('SELECT A STORE'),
              content: Container(
                width: double.maxFinite,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.all(8),
                        child: GestureDetector(
                            onTap: () {
                              Get.back();
                              print(locale[index]['name'] + ' selected----');
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

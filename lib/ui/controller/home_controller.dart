import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find(tag: HOME_CONTROLLER);
  late ScrollController scrollController = ScrollController();
  var offset = 0.0;
  var showFAB = true.obs;
  @override
  void onInit() {
    setSelectedGate();
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

  RxString selectedGate = 'BEAUTY GATE'.obs;
  final List gateList = [
    {'name': 'Beauty Gate'.toUpperCase(), 'id': 'ID1'},
    {'name': 'Fashion Gate'.toUpperCase(), 'id': 'ID2'},
    {'name': 'Antiques gate'.toUpperCase(), 'id': 'ID1'},
    {'name': 'Modern Arts gate'.toUpperCase(), 'id': 'ID1'},
    {'name': 'Altaras & Sport gate'.toUpperCase(), 'id': 'ID1'},
    {'name': 'Stars & Fans gate'.toUpperCase(), 'id': 'ID1'},
    {'name': 'Pets gate'.toUpperCase(), 'id': 'ID1'},
    {'name': 'Bikes & Moto gate'.toUpperCase(), 'id': 'ID1'},
    {'name': 'Rent & Shared gate'.toUpperCase(), 'id': 'ID1'},
  ];
  final box = GetStorage(BOX_APP);
  updateSelectedGate(gate) {
    box.write(BOX_GATE_SELECTED, gate);
  }

  setSelectedGate() {
    selectedGate.value = getStorageStringValue(BOX_GATE_SELECTED) != ''
        ? getStorageStringValue(BOX_GATE_SELECTED)
        : 'BEAUTY GATE';
  }

  buildDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) => AlertDialog(
              title: Text('SELECT A GATE'),
              content: Container(
                width: double.maxFinite,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.all(8),
                        child: GestureDetector(
                            onTap: () {
                              Get.back();
                              print(gateList[index]['name'] + ' selected----');
                              selectedGate.value = gateList[index]['name'];
                              updateSelectedGate(gateList[index]['name']);
                            },
                            child: Text(gateList[index]['name']))),
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.blue,
                        ),
                    itemCount: gateList.length),
              ),
            ));
  }
}

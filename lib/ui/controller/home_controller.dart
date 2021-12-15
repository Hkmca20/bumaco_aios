import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find(tag: HOME_CONTROLLER);
  final bannerController = BannerController.to;
  late final ScrollController scrollController;
  // var offset = 0.0;
  var showFAB = false.obs;
  @override
  void onInit() {
    setSelectedGate();
    addScrollListener();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(() {
      print('home scrollControl removed');
    });
    scrollController.dispose();
    super.onClose();
  }

  addScrollListener() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      // offset = scrollController.offset;
      if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        showFAB(false);
      } else {
        showFAB(true);
      }
      print('----->${showFAB.value}');
    });
  }

  RxString selectedGate = ''.obs;
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
  updateSelectedGate(index) {
    selectedGate.value = gateList[index]['name'];
    box.write(BOX_GATE_SELECTED, gateList[index]['name']);
    bannerController.fetchBanners();
  }

  setSelectedGate() {
    selectedGate.value = getStorageStringValue(BOX_GATE_SELECTED);
    if (selectedGate.value == '') {
      updateSelectedGate(0);
    }
  }

  // gateDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (builder) => AlertDialog(
  //             title: Text('SELECT A GATE'),
  //             content: Container(
  //               width: double.maxFinite,
  //               child: ListView.separated(
  //                   shrinkWrap: true,
  //                   itemBuilder: (context, index) => Padding(
  //                       padding: EdgeInsets.all(8),
  //                       child: GestureDetector(
  //                           onTap: () {
  //                             Get.back();
  //                             updateSelectedGate(index);
  //                           },
  //                           child: Text(gateList[index]['name']))),
  //                   separatorBuilder: (context, index) => Divider(
  //                         color: Colors.blue,
  //                       ),
  //                   itemCount: gateList.length),
  //             ),
  //           ));
  // }

  gateBottomsheet(BuildContext context) {
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
            'enter_a_gate'.tr.text.semiBold.xl2.make().p8(),
            VxDivider(),
            Container(
              padding: EdgeInsets.all(2),
              height: _screenSize.height / 3 + 40,
              alignment: Alignment.center,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: gateList.length,
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
                        '${index + 1}.  ${gateList[index]['name']}'
                            .tr
                            .text
                            .xl
                            .color(selectedGate.value == gateList[index]['name']
                                ? kPrimaryColor
                                : kDarkGreyColor)
                            .fontWeight(FontWeight.w300)
                            .make()
                            .p8()
                            .expand(),
                        // '${gateList[index]['name']}'
                        //     .text
                        //     .align(TextAlign.end)
                        //     .size(16)
                        //     .fontWeight(FontWeight.w300)
                        //     .make()
                        //     .p16()
                        //     .expand(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: kGreyLightColor,
                        ),
                      ]).p8(),
                      onTap: () {
                        Get.back();
                        updateSelectedGate(index);
                      },
                    );
                  }),
            ),
          ]);
        });
  }
}

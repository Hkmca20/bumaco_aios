import 'dart:ui';

import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class BoxSelection {
  final isSelected;
  final title;
  final options;
  BoxSelection({this.title = '', this.isSelected = false, this.options = ''});
}

class FilterView extends StatelessWidget {
  FilterView({Key? key}) : super(key: key);
  final pController = ProductController.to;
  final fController = Get.find<FilterController>();

  @override
  Widget build(BuildContext context) {
    String filterText = '';
    final leftList = [
      'Category',
      'Brand',
      'Price',
      'Discount',
      'Avg Customer Rating',
      'Hair Type',
      'Concern',
      'Gender',
      'Formulation',
      'Gender',
      'Formulation',
      'Gender',
      'Formulation',
      'Preference'
    ];
    final rightList = {
      0: ['Hair', 'Personal Care', 'Appliance', 'Men\'s Store'],
      1: ['Matrx', 'L\'Oreal Professional'],
      2: ['0 - 499', '500 - 999', '1000 - 1999', '2000 and above'],
      3: ['10% and above', 'All discounted products'],
      4: [
        '4 stars and above',
        '3 stars and above',
        '2 stars and above',
        '1 stars and above'
      ],
      5: [
        'Normal',
        'Dryness',
        'Straight',
        'Oily',
        'Fine',
        'Curly',
        'Dull Hair',
        'Thin',
        'Thick',
        'Wavy'
      ],
      6: [
        'Normal',
        'Dryness',
        'Straight',
        'Oily',
        'Fine',
        'Curly',
        'Dull Hair',
        'Thin',
        'Thick',
        'Wavy'
      ],
      7: ['Unisex', 'Female'],
      8: ['Liquid', 'Mask', 'Cream', 'Serum', 'Foam', 'Oil', 'Sprey'],
      9: ['Organic', 'Natural', 'Harbal'],
    };
    fController.chageNewList(rightList[0]);
    // final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppbarHome(
        title: 'Filter By',
        centerTitle: true,
        actionList: [
          IconButton(
            icon: Icon(Icons.refresh),
            tooltip: 'Apply Filters',
            onPressed: () {
              Get.back();

              if (fController.secondListChecked.isTrue)
                filterText = 'applied';
              else
                filterText = '';

              pController.searchSortFilterProducts(filterText);
            },
          ),
        ],
      ),
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(bottom: 80),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 5,
                child: ListView.builder(
                    itemCount: leftList.length,
                    itemBuilder: (context, index) {
                      final item = leftList[index];
                      return Obx(() {
                        final isSelected =
                            fController.selectedFilterIndex.value == index;
                        return InkWell(
                          onTap: () {
                            fController.selectedFilterIndex.value = index;

                            fController.chageNewList(rightList[index]);

                            fController.filterCount.value = 0;
                            fController.secondListChecked.value = false;
                          },
                          child: VStack(
                            [
                              HStack(
                                [
                                  isSelected
                                      ? Container(
                                          color: kPrimaryColor,
                                          height: 60,
                                          width: 3,
                                        )
                                      : SizedBox(
                                          width: 3,
                                          height: 60,
                                        ),
                                  isSelected
                                      ? item.text.bold.lg
                                          .color(kPrimaryColor)
                                          .make()
                                          .p8()
                                          .expand()
                                      : item.text.bold.lg.make().p8().expand(),
                                  Visibility(
                                    visible:
                                        (fController.filterCount.value != 0 &&
                                                isSelected)
                                            ? true
                                            : false,
                                    child: Icon(
                                      Icons.account_circle,
                                      color: kTransparentColor,
                                    )
                                        .badge(
                                            size: 12,
                                            count:
                                                fController.filterCount.value,
                                            color: kPrimaryColor)
                                        .p12(),
                                  ),

                                  Icon(Icons.arrow_forward_ios,
                                          color:
                                              isSelected ? kPrimaryColor : null,
                                          size: 12)
                                      .p8(),
                                  // tileColor: isSelected
                                  //     ? kPrimaryLightColor.withOpacity(0.5)
                                  //     : null,
                                  // ListTile(
                                  //   title: isSelected
                                  //       ? item.text
                                  //           .fontWeight(FontWeight.w900)
                                  //           .color(kPrimaryColor)
                                  //           .size(16)
                                  //           .make()
                                  //       : item.text.bold.size(16).make(),
                                  //   tileColor: isSelected
                                  //       ? kPrimaryLightColor.withOpacity(0.5)
                                  //       : null,
                                  //   onTap: () {
                                  //     fController.selectedFilterIndex.value = index;

                                  //     fController.chageNewList(rightList[index]);
                                  //   },
                                  //   trailing: Icon(Icons.arrow_forward_ios),
                                  // ),
                                ],
                                alignment: MainAxisAlignment.spaceEvenly,
                                crossAlignment: CrossAxisAlignment.center,
                              ),
                              VxDivider(indent: 10, endIndent: 30),
                            ],
                          ),
                        );
                      });

                      // GestureDetector(
                      //   onTap: () {},
                      //   child: BoxSelectionButton(
                      //     isSelected: projectType[index].isSelected,
                      //     option: projectType[index].options,
                      //     title: projectType[index].title,
                      //   ),
                      // );
                    }),
              ),
              Expanded(
                flex: 6,
                child: Obx(
                  () => ListView.builder(
                      itemCount: fController.newList.length,
                      itemBuilder: (context, index) {
                        final item = fController.newList[index].toString();
                        return InkWell(
                          onTap: () {
                            // fController.secondListChecked.toggle();
                          },
                          child: HStack([
                            Expanded(child: item.text.lg.make().p12()),
                            Obx(
                              () => Checkbox(
                                value: fController.secondListChecked.isTrue,
                                activeColor: kPrimaryColor,
                                onChanged: (value) {
                                  // fController.selectedCheckboxValue =
                                  //     value.toString();
                                  fController.secondListChecked.toggle();
                                  if (fController.secondListChecked.isTrue) {
                                    fController.filterCount.value =
                                        fController.newList.length;
                                  } else {
                                    fController.filterCount.value = 0;
                                  }
                                },
                              ),
                            )
                          ]),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 10,
          right: 10,
          child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [kPrimaryColorDark, kPrimaryColor],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: MaterialButton(
                onPressed: () {
                  Get.back();
                  if (fController.secondListChecked.isTrue)
                    filterText = 'applied';
                  else
                    filterText = '';

                  pController.searchSortFilterProducts(filterText);
                }, // Click Listener
                child: 'APPLY'.text.xl.white.align(TextAlign.center).make(),
              )),
        ),
      ]),
    );
  }
}

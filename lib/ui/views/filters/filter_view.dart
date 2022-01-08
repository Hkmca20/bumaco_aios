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
  final fController = FilterController.to;

  @override
  Widget build(BuildContext context) {
    // final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppbarHome(
        title: 'Filter By',
        centerTitle: true,
        actionList: [
          IconButton(
            icon: Icon(Icons.clear),
            tooltip: 'Clear Filters',
            onPressed: () {
              clearAllFilterApplied();
            },
          ),
        ],
      ),
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(bottom: 50),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 5,
                child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 4,
                  child: ListView.builder(
                      itemCount: fController.filterList.length,
                      itemBuilder: (context, index) {
                        final item = fController.filterList[index];
                        return Obx(() {
                          final isSelected =
                              fController.selectedFilterIndex.value == index;
                          return InkWell(
                            onTap: () {
                              fController.selectedFilterIndex.value = index;
                            },
                            child: VStack(
                              [
                                HStack(
                                  [
                                    isSelected
                                        ? Container(
                                            color: kPrimaryColor,
                                            height: 60,
                                            width: 4,
                                          )
                                        : SizedBox(
                                            width: 4,
                                            height: 60,
                                          ),
                                    isSelected
                                        ? item.name.text.bold.base
                                            .color(kPrimaryColor)
                                            .make()
                                            .p4()
                                            .expand()
                                        : item.name.text.bold.base
                                            .make()
                                            .p4()
                                            .expand(),
                                    Visibility(
                                      visible: item.itemCount.value != 0,
                                      child: Icon(
                                        Icons.account_circle,
                                        color: kTransparentColor,
                                      )
                                          .badge(
                                              size: 14,
                                              count: fController
                                                  .filterList[index]
                                                  .itemCount
                                                  .value,
                                              color: kPrimaryColor)
                                          .p8(),
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                            color: isSelected
                                                ? kPrimaryColor
                                                : null,
                                            size: 12)
                                        .p8(),
                                  ],
                                  alignment: MainAxisAlignment.spaceEvenly,
                                  crossAlignment: CrossAxisAlignment.center,
                                ),
                                VxDivider(indent: 10, endIndent: 30),
                              ],
                            ),
                          );
                        });
                      }),
                ),
              ),
              Expanded(
                flex: 6,
                child: Obx(
                  () => ListView.builder(
                      itemCount: fController
                          .filterList[fController.selectedFilterIndex.value]
                          .list
                          .length,
                      itemBuilder: (context, index) {
                        final FSubItem item = fController
                            .filterList[fController.selectedFilterIndex.value]
                            .list[index];
                        print('item.itemType======' + item.itemType.toString());
                        return InkWell(
                          onTap: () {
                            // fController.secondListChecked.toggle();
                          },
                          child: HStack([
                            Expanded(child: item.name.text.lg.make().p12()),
                            Obx(
                              () => fController
                                          .filterList[fController
                                              .selectedFilterIndex.value]
                                          .itemType ==
                                      2
                                  ? Radio<String>(
                                      activeColor: kPrimaryColor,
                                      value: item.name,
                                      groupValue: fController
                                          .filterList[fController
                                              .selectedFilterIndex.value]
                                          .fRadioSelect
                                          .value,
                                      toggleable: true,
                                      onChanged: (newValue) {
                                        fController.filterList[fController
                                                .selectedFilterIndex.value]
                                            .itemCount(0);
                                        for (int i = 0;
                                            i <
                                                fController
                                                    .selectedFilter.length;
                                            i++) {
                                          if (fController.selectedFilter
                                                  .toString() ==
                                              fController
                                                  .filterList[fController
                                                      .selectedFilterIndex
                                                      .value]
                                                  .fRadioSelect
                                                  .value) {
                                            fController.selectedFilter
                                                .remove(i);
                                          }
                                        }
                                        fController.filterList[fController
                                                .selectedFilterIndex.value]
                                            .fRadioSelect('');
                                        if (newValue == null ||
                                            fController
                                                    .filterList[fController
                                                        .selectedFilterIndex
                                                        .value]
                                                    .fRadioSelect
                                                    .value ==
                                                newValue) {
                                        } else {
                                          fController.filterList[fController
                                                  .selectedFilterIndex.value]
                                              .fRadioSelect(newValue);
                                          fController.filterList[fController
                                                  .selectedFilterIndex.value]
                                              .itemCount(1);
                                          fController.selectedFilter
                                              .add(item.name);
                                        }
                                      },
                                    )
                                  : Checkbox(
                                      value: item.selected.value,
                                      activeColor: kPrimaryColor,
                                      onChanged: (value) {
                                        if (item.selected.isTrue) {
                                          fController
                                              .filterList[fController
                                                  .selectedFilterIndex.value]
                                              .list[index]
                                              .selected(false);
                                          fController
                                              .filterList[fController
                                                  .selectedFilterIndex.value]
                                              .itemCount--;
                                          for (int i = 0;
                                              i <
                                                  fController
                                                      .selectedFilter.length;
                                              i++) {
                                            if (fController.selectedFilter
                                                    .toString() ==
                                                item.name) {
                                              fController.selectedFilter
                                                  .remove(i);
                                            }
                                          }
                                        } else {
                                          fController
                                              .filterList[fController
                                                  .selectedFilterIndex.value]
                                              .list[index]
                                              .selected(true);
                                          fController
                                              .filterList[fController
                                                  .selectedFilterIndex.value]
                                              .itemCount++;
                                          for (int i = 0;
                                              i <
                                                  fController
                                                      .selectedFilter.length;
                                              i++) {
                                            if (fController.selectedFilter
                                                    .toString() ==
                                                item.name) {
                                              fController.selectedFilter
                                                  .add(item.name);
                                            }
                                          }
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
          left: 0,
          right: 0,
          child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [kPrimaryColorDark, kPrimaryColor],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                  borderRadius: BorderRadius.all(Radius.circular(1.0))),
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 0.0),
              child: MaterialButton(
                onPressed: () {
                  Get.back();
                  getFilterApplyStatus();
                  pController.searchSortFilterProducts(fController.filterText);
                  pController.fetchProductAll();
                },
                child: 'APPLY'.text.xl.white.align(TextAlign.center).make(),
              )),
        ),
      ]),
    );
  }

  getFilterApplyStatus() {
    fController.filterText = '';
    // for (int i = 0; i < fController.filterList.length; i++) {
    //   if (fController.filterList[i].itemCount > 0) {
    //     fController.filterText = 'applied';
    //     return true;
    //   }
    // }
    for (int j = 0; j < fController.selectedFilter.length; j++) {
      if (fController.filterText.isEmpty) {
        fController.filterText = fController.selectedFilter[j];
      } else {
        fController.filterText =
            fController.filterText + ',' + fController.selectedFilter[j];
      }
    }
    // return false;
  }

  clearAllFilterApplied() {
    fController.filterText = '';
    fController.selectedFilter.clear();
    for (int i = 0; i < fController.filterList.length; i++) {
      final FilterItem item = fController.filterList[i];
      if (item.fSelect) {
        fController.filterList[i].fSelect = false;
      }
      fController.filterList[i].fRadioSelect('');
      fController.filterList[i].itemCount(0);
      for (int j = 0; j < item.list.length; j++) {
        final subItem = item.list[j];
        if (subItem.selected.isTrue) {
          fController.filterList[i].list[j].selected(false);
        }
      }
    }
  }
}

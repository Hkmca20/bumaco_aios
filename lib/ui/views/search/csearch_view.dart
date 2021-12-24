import 'dart:math';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/search/search_data.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class RecentSearchInfo {
  final String id;
  final String title;
  final Color backgroundColor;

  RecentSearchInfo(this.id, this.title, this.backgroundColor);
}

class CSearchView extends StatefulWidget {
  CSearchView({Key? key}) : super(key: key);

  @override
  State<CSearchView> createState() => _CSearchViewState();
}

class _CSearchViewState extends State<CSearchView> {
  final OutlineInputBorder oBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(2),
    borderSide: BorderSide(color: kGreyLightColor),
    gapPadding: 8,
  );

  final List<RecentSearchInfo> popularBrandList = [
    RecentSearchInfo('1', 'Wow',
        Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo('2', 'L\'Oreal',
        Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo('3', 'Lakme',
        Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo('4', 'Nykaa',
        Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  ];

  final List<RecentSearchInfo> popularCategoryList = [
    RecentSearchInfo('1', 'Face',
        Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo('2', 'Eyes',
        Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo('3', 'Hair',
        Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo('4', 'Lips',
        Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo('5', 'Body Art',
        Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo('6', 'Makeup Kits',
        Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  ];

  final searchController = SearchController.to;
  final selectedGate = getStorageStringValue(BOX_GATE_SELECTED);

  openSearchView(context) async {
    final result = await showSearch(context: context, delegate: SearchData());
    print('------------SearchResult----------->' + result.toString());
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppbarHome(title: 'Search Anything', actionList: [
        IconButton(
          icon: Icon(Icons.search),
          tooltip: 'search'.tr,
          onPressed: () async {
            openSearchView(context);
          },
        ),
      ]),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              searchTextField(context),
              8.heightBox,
              SectionTile(title: 'Popular Categories'.toUpperCase()),
              recentSearchItems(context, popularCategoryList),
              Divider(),
              12.heightBox,
              SectionTile(title: 'Popular Brands'.toUpperCase()),
              recentSearchItems(context, popularBrandList),
              Divider(),
              20.heightBox,
              Lottie.asset(girlFaceLottie,
                      delegates: LottieDelegates(
                        text: (initialText) => '**$initialText**',
                        values: [
                          ValueDelegate.color(
                            const ['Shape Layer 1', 'Rectangle', 'Fill 1'],
                            value: Colors.red,
                          ),
                          ValueDelegate.opacity(
                            const ['Shape Layer 1', 'Rectangle'],
                            callback: (frameInfo) =>
                                (frameInfo.overallProgress * 100).round(),
                          ),
                          ValueDelegate.position(
                            const ['Shape Layer 1', 'Rectangle', '**'],
                            relative: const Offset(100, 200),
                          ),
                        ],
                      ),
                      controller: searchController.aController,
                      onLoaded: (conposition) {
                searchController.aController
                  ..duration = conposition.duration
                  ..repeat(reverse: true);
              }, height: _size.width / 2, width: _size.width / 2)
                  .centered(),
            ]),
      ),
    );
  }

  searchTextField(context) {
    return Container(
      height: 40,
      margin: EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () async {
          openSearchView(context);
        },
        child: TextField(
          enabled: false,
          style: Theme.of(context).textTheme.headline6,
          // onChanged: onTextChange,
          decoration: InputDecoration(
            focusedBorder: oBorder,
            enabledBorder: oBorder,
            fillColor: Colors.black.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              color: kGreyLightColor,
            ),
            hintText: 'Search on ' + selectedGate,
            hintStyle: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kGreyLightColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: kGreyLightColor, width: 1.0),
            ),
            contentPadding: EdgeInsets.all(2),
          ),
        ),
      ),
    );
  }

  recentSearchItems(context, itemList) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Wrap(
        spacing: 3.0,
        runSpacing: 3.0,
        children: List.generate(itemList.length, (index) {
          final item = itemList[index];
          return InkWell(
            onTap: () {
              Get.back();
              Get.toNamed(productRoute, arguments: {
                ARG_CATEGORY_ITEM:
                    CategoryData(id: item.id, category: item.title)
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Chip(
                label: Text(item.title),
                padding: EdgeInsets.all(4),
                backgroundColor: item.backgroundColor,
              ),
            ),
          );
        }),
      ),
    );
  }
}

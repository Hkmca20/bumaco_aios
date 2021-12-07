import 'dart:math';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/search/search_data.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class RecentSearchInfo {
  final String title;
  final Color backgroundColor;

  RecentSearchInfo(this.title, this.backgroundColor);
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
    RecentSearchInfo(
        'Wow', Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo('L\'Oreal',
        Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo(
        'Lakme', Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo(
        'Nykaa', Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  ];

  final List<RecentSearchInfo> popularCategoryList = [
    RecentSearchInfo(
        'Face', Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo(
        'Eyes', Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo(
        'Hair', Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo(
        'Lips', Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo('Body Art',
        Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    RecentSearchInfo('Makeup Kits',
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
              SizedBox(height: 8),
              SectionTile(title: 'Popular Categories'.toUpperCase()),
              recentSearchItems(context, popularCategoryList),
              Divider(),
              SizedBox(height: 12),
              SectionTile(title: 'Popular Brands'.toUpperCase()),
              recentSearchItems(context, popularBrandList),
              Divider(),
            ]),
      ),
    );
  }

  searchTextField(context) {
    return Container(
      height: 60,
      padding: EdgeInsets.all(12),
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
                'arg_category_item':
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

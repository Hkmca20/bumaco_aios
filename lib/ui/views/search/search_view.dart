import 'dart:math';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/category_controller.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentSearchInfo {
  final String title;
  final Color backgroundColor;

  RecentSearchInfo(this.title, this.backgroundColor);
}

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    final List<RecentSearchInfo> recentSearcheTerms = [
      RecentSearchInfo('Makeup, USA',
          Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      RecentSearchInfo('Face, India',
          Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      RecentSearchInfo('Hair, UAE',
          Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      RecentSearchInfo('Lipstick, UK',
          Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    ];
    Icon customIcon = const Icon(Icons.search);
    Widget customSearchBar = const Text('My Personal Journal');
    return Scaffold(
      appBar: AppbarHome(
        title: 'Search Anything',
        actionList: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'type in products...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              });
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            height: 80,
            padding: EdgeInsets.all(10),
            child: TextField(
              style: Theme.of(context).textTheme.headline6,
              // onChanged: onTextChange,
              decoration: InputDecoration(
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: kGreyLightColor,
                  ),
                  hintText: 'Search something ...',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: kGreyLightColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          SizedBox(height: 4),
          SectionTile(title: 'Recent Searches'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Wrap(
              spacing: 3.0, // gap between adjacent chips
              runSpacing: 3.0, // gap between lines
              children: List.generate(recentSearcheTerms.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Chip(
                    label: Text(recentSearcheTerms[index].title),
                    padding: EdgeInsets.all(4),
                    backgroundColor: recentSearcheTerms[index].backgroundColor,
                  ),
                );
              }),
            ),
          ),
          Divider(),
          SectionTile(title: 'Popular Searches'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Wrap(
              spacing: 3.0,
              runSpacing: 3.0,
              children: List.generate(recentSearcheTerms.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Chip(
                    label: Text(recentSearcheTerms[index].title),
                    padding: EdgeInsets.all(4),
                    backgroundColor: recentSearcheTerms[index].backgroundColor,
                  ),
                );
              }),
            ),
          ),
          Divider(),
          SectionTile(title: 'Popular Categories'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Wrap(
              spacing: 3.0,
              runSpacing: 3.0,
              children: List.generate(recentSearcheTerms.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Chip(
                    label: Text(recentSearcheTerms[index].title),
                    padding: EdgeInsets.all(4),
                    backgroundColor: recentSearcheTerms[index].backgroundColor,
                  ),
                );
              }),
            ),
          ),
        ]),
      ),
    );
  }
}

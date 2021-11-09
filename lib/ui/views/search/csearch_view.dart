import 'dart:math';

import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/views/search/search_delegate.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class RecentSearchInfo {
  final String title;
  final Color backgroundColor;

  RecentSearchInfo(this.title, this.backgroundColor);
}

class CSearchView extends StatelessWidget {
  CSearchView({Key? key}) : super(key: key);

  final OutlineInputBorder oBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: kGreyLightColor),
    gapPadding: 8,
  );
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHome(
        title: 'Search Anything',
        actionList: [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'search'.tr,
            onPressed: () async {
              final result =
                  await showSearch(context: context, delegate: SearchData());
              print('------------SearchView2>' + result.toString());
            },
          ),
          IconButton(
            icon: Icon(Icons.search_off_outlined),
            tooltip: 'share'.tr,
            onPressed: () async {
              final CountryModel? result = await showSearch<CountryModel>(
                context: context,
                delegate: CustomDelegate(),
              );
              print('------------1>' + result!.name);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              searchTextField(context),
              SizedBox(height: 4),
              SectionTile(title: 'Recent Searches'),
              recentSearchItems(context),
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
          final CountryModel? result = await showSearch<CountryModel>(
            context: context,
            delegate: CustomDelegate(),
          );
          print('------------textField onClick--------1>' + result!.name);
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
            hintText: 'Search on ' + 'app_name'.tr,
            hintStyle: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kGreyLightColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: kGreyLightColor, width: 1.0),
            ),
            contentPadding: EdgeInsets.all(5),
          ),
        ),
      ),
    );
  }

  recentSearchItems(context) {
    return Padding(
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
    );
  }
}

final cityList = ['aaxxaaaa', 'bbbbyybbbbbbb', 'cccczzcccc'];
final recentCItyList = ['ddddddddddd', 'eeeeeeee', 'ffffffffff', 'ggggggggg'];

class SearchData<T> extends SearchDelegate<String> {
  // @override
  // String get searchFieldLabel => 'My hint text';
  SearchData({
    String hintText = "Search here...",
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          searchFieldStyle: TextStyle(
            color: kPrimaryColor,
          ),
        );
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, query);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        color: kPrimaryColor,
        child: query.text.make(),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCItyList
        : cityList
            .where((element) =>
                (element.contains(query) || element.startsWith(query)))
            .toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              showResults(context);
            },
            leading: Icon(Icons.search),
            // title: RichText(
            //   text: TextSpan(
            //       text: suggestionList[index].substring(0, query.length),
            //       style: TextStyle(fontWeight: FontWeight.bold),
            //       children: [
            //         TextSpan(
            //             text: suggestionList[index].substring(query.length),
            //             style: TextStyle(fontWeight: FontWeight.normal))
            //       ]),
            // ),
            title: suggestionList[index].text.make(),
            trailing: Icon(Icons.location_city),
          );
        });
  }
}

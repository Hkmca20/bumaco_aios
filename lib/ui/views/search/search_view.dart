import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/category_controller.dart';
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
      RecentSearchInfo('Makeup, USA', Colors.yellow),
      RecentSearchInfo('Face, India', Colors.purple),
      RecentSearchInfo('Hair, UAE', Colors.lightGreen),
      RecentSearchInfo('Lipstick, UK', Colors.orange),
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 80,
                padding: EdgeInsets.all(10),
                child: TextField(
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.black),
                  // onChanged: onTextChange,
                  decoration: InputDecoration(
                      fillColor: Colors.black.withOpacity(0.1),
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search something ...',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.black45),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.zero),
                ),
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: new Text(
                  "Recent Searches",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Wrap(
                spacing: 3.0, // gap between adjacent chips
                runSpacing: 3.0, // gap between lines
                children: List.generate(recentSearcheTerms.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Chip(
                      label: Text(recentSearcheTerms[index].title),
                      padding: EdgeInsets.all(4),
                      backgroundColor:
                          recentSearcheTerms[index].backgroundColor,
                    ),
                  );
                }),
              ),
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
                        backgroundColor:
                            recentSearcheTerms[index].backgroundColor,
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

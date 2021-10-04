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
class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final List<RecentSearchInfo> recentSearcheTerms = [
      RecentSearchInfo('Flutter, USA', Colors.yellow),
      RecentSearchInfo('Flutter Developer, India', Colors.purple),
      RecentSearchInfo('Adobe XD, UAE', Colors.lightGreen),
      RecentSearchInfo('UX Designer, UK', Colors.orange),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Wrap(
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

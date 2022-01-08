import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/widgets/csearch_item.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class CustomDelegate<T> extends SearchDelegate<String> {
  final bController = BucketController.to;
  final pController = ProductController.to;
  // @override
  // String get searchFieldLabel => 'My hint text';
  CustomDelegate({
    String hintText = "Search for brands, products etc.",
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          searchFieldStyle: TextStyle(
            color: kGreyLightColor,
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
      color: kPrimaryColor,
      height: 100,
      width: 100,
      // child: Card(
      //   child: query.text.make(),
      // ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // if (query.isNotEmpty)
    //   listToShow = data
    //       .where((CountryModel e) =>
    //           e.name.toLowerCase().contains(query.toLowerCase()) ||
    //           e.name.toLowerCase().startsWith(query.toLowerCase()))
    //       .toList();
    // else
    //   listToShow = data;

    if (query.isEmpty || query.length < 2) {
      pController.productListSearch.clear();
    } else {
      pController.searchSortFilterProducts(query);
    }
    // final suggestionList =
    // query.isEmpty ? recentCItyList :
    // pController.searchProductList;

    return Obx(
      () =>
          // pController.isLoading.isTrue
          //     ? LoadingWidget() :
          ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(height: 1, indent: 40, endIndent: 80);
              },
              itemCount: pController.productListSearch.length,
              itemBuilder: (context, index) {
                final item = pController.productListSearch[index];
                return CSearchItem(
                  prod: item,
                  bController: bController,
                  pController: pController,
                  index: index,
                  offset: pController.offset.value,
                );
                // .onTap(() {
                //   showResults(context);
                // });
              }),
    );
  }
}

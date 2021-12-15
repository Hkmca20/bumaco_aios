import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/widgets/csearch_item.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class SearchData<T> extends SearchDelegate<String> {
  final bController = BucketController.to;
  final pController = ProductController.to;
  // @override
  // String get searchFieldLabel => 'My hint text';
  SearchData({
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
    if (query.length < 2) {
      pController.productListSearch.clear();
    } else {
      pController.searchSortFilterProducts(query);
    }
    // final suggestionList =
    // query.isEmpty ? recentCItyList :
    // pController.searchProductList;

    return Obx(
      () => ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(indent: 40, endIndent: 80);
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
          }),
    );
  }
}

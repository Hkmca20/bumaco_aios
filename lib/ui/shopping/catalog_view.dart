import 'package:bumaco_aios/app_config/app_bar.dart';
import 'package:bumaco_aios/ui/shopping/model/models.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogView extends StatefulWidget {
  CatalogView({Key? key}) : super(key: key);

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  @override
  Widget build(BuildContext context) {
    late final Category catalogItem;
    if (Get.arguments != null) {
      catalogItem = Get.arguments['get_catalog'];
    }
    final List<Product> catalogProducts = Product.productList
        .where((product) => product.produntCategory == catalogItem.categoryName)
        .toList();
      print('catalogProducts===' + catalogProducts.toString());
      print('Product.productList===' + Product.productList.toString());
    return Scaffold(
        appBar: BumacoAppbar(
          title: catalogItem.categoryName,
        ),
        // bottomNavigationBar: ,
        body: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            itemCount: catalogProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.15),
            itemBuilder: (context, index) {
              return Center(child: ProductCard(product: catalogProducts[index]));
            }));
  }
}

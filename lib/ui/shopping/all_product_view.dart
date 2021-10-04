import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/product_controller.dart';
import 'package:bumaco_aios/ui/widgets/aproduct_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();
    return Scaffold(
      appBar: AppbarHome(
        title: 'Bumaco',
        actionList: [
          IconButton(
            icon: Icon(Icons.favorite_rounded),
            color: kPrimaryColorDark,
            tooltip: 'Wish List',
            onPressed: () {
              Get.toNamed(wishlistRoute);
            },
          ), //IconB
          IconButton(
              onPressed: () {
                productController.changeColumnCount(1);
              },
            color: kPrimaryColorDark,
              tooltip: 'List Item',
              icon: Icon(Icons.view_list_rounded)),
          IconButton(
              onPressed: () {
                productController.changeColumnCount(2);
              },
            color: kPrimaryColorDark,
              tooltip: 'Grid Item',
              icon: Icon(Icons.grid_view_outlined)),
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            color: kPrimaryColorDark,
            tooltip: 'View Cart Item',
            onPressed: () {
              productController.fetchProducts();
            },
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          //All Items Home page
          Expanded(
            child: Obx(
              () => productController.isLoading.isTrue
                  ? LoadingWidget()
                  : StaggeredGridView.countBuilder(
                      controller: productController.scrollController,
                      crossAxisCount: productController.columnCount.value,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 12,
                      itemCount: productController.productList.length,
                      itemBuilder: (context, index) {
                        return AProductTile(
                            prod: productController.productList[index],
                            index: index,
                            itemSize: productController.productList.length,
                            offset: productController.offset.value);
                      },
                      staggeredTileBuilder: (int index) {
                        return StaggeredTile.fit(1);
                      },
                    ),
            ),
          ),
        ],
      )),
    );
  }
}

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/home/item_notification.dart';
import 'package:bumaco_aios/ui/widgets/cproduct_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    productController.getFavouriteList();
    return Scaffold(
      appBar: AppbarHome(
        title: 'Wish List',
        actionList: [
          IconButton(
              onPressed: () {
                productController.changeColumnCount(1);
              },
              tooltip: 'List Item',
              icon: Icon(Icons.view_list_rounded)),
          IconButton(
              onPressed: () {
                productController.changeColumnCount(2);
              },
              tooltip: 'Grid Item',
              icon: Icon(Icons.grid_view_outlined)),
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            tooltip: 'View Cart Item',
            onPressed: () {
              productController.fetchAllProducts();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => productController.isLoading.isTrue
                    ? LoadingWidget()
                    : StaggeredGridView.countBuilder(
                        controller: productController.scrollController,
                        crossAxisCount: productController.columnCount.value,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        itemCount: productController.favouriteList.length,
                        padding: EdgeInsets.all(4),
                        staggeredTileBuilder: (int index) {
                          return StaggeredTile.fit(1);
                        },
                        itemBuilder: (context, index) {
                          ProductModel item =
                              productController.favouriteList[index];
                          return CProductTile(
                            prod: item,
                            pController: productController,
                          );
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

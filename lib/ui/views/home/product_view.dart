import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/bucket_controller.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/widgets/cproduct_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'favourite_view.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    final bucketController = Get.find<BucketController>();
    var categoryItem = CategoryModel(category: 'Product List');
    if (Get.arguments != null) {
      categoryItem = Get.arguments['arg_category_item'];
    }

    return Scaffold(
      appBar: AppbarHome(
        title: categoryItem.category,
        actionList: [
          IconButton(
            icon: Icon(Icons.favorite_rounded),
            tooltip: 'Wish List',
            onPressed: () {
              Get.to(() => FavouriteView());
              // Get.toNamed(wishlistRoute);
            },
          ), //IconB
          IconButton(
            onPressed: () {
              print(productController.columnCount);
              productController.columnCount.value == 2
                  ? productController.changeColumnCount(1)
                  : productController.changeColumnCount(2);
            },
            // tooltip: 'List Item',
            icon: Obx(() => Icon(productController.columnCount.value == 2
                ? Icons.view_list_rounded
                : Icons.grid_view_outlined)),
          ),
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
                        controller: productController.scroll,
                        crossAxisCount: productController.columnCount.value,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        itemCount: productController.allProductList.length,
                        padding: EdgeInsets.all(4),
                        staggeredTileBuilder: (int index) {
                          return StaggeredTile.fit(1);
                        },
                        itemBuilder: (context, index) {
                          ProductModel item =
                              productController.allProductList[index];
                          return CProductTile(
                            bController: bucketController,
                            pController: productController,
                            prod: item,
                            index: index,
                            itemSize: productController.allProductList.length,
                            offset: productController.offset.value,
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

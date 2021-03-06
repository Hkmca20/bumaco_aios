import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/checkout/bucket_view.dart';
import 'package:bumaco_aios/ui/widgets/cproduct_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CProductMoreView extends StatelessWidget {
  const CProductMoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.to;
    final bucketController = BucketController.to;
    productController.getFavouriteList();
    return Scaffold(
      appBar: AppbarHome(
        title: 'All Products',
        actionList: [
          IconButton(
            icon: Obx(
              () => bucketController.bucketList.length == 0
                  ? Icon(Icons.shopping_bag_outlined)
                  : Stack(children: [
                      Positioned(
                        top: 5.0,
                        right: 5.0,
                        child: Icon(Icons.shopping_bag_outlined),
                      ),
                      Positioned(
                        top: -1.0,
                        right: -1.0,
                        child: Icon(
                          Icons.brightness_1_rounded,
                          size: 17.0,
                          color: kPrimaryColor,
                        ),
                      ),
                      Positioned(
                        top: 1.0,
                        right: 4.0,
                        child: bucketController.bucketList.length.text.xs.white
                            .make()
                            .centered(),
                      ),
                    ]),
            ),
            tooltip: 'view_cart_item'.tr,
            onPressed: () {
              Get.back();
              Get.to(() => BucketView());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => productController.productListAll.length == 0
                    ? EmptyFailureNoInternetView(
                        image: emptyLottie,
                        title: 'Content unavailable',
                        description: 'Content not found',
                        buttonText: "",
                        onPressed: () {},
                      )
                    // : StaggeredGridView.countBuilder(
                    : MasonryGridView.count(
                        crossAxisCount: productController.columnCount.value,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        itemCount: productController.productListAll.length,
                        padding: EdgeInsets.all(4),
                        // staggeredTileBuilder: (int index) {
                        //   return StaggeredTile.fit(1);
                        // },
                        itemBuilder: (context, index) {
                          ProductModel item =
                              productController.productListAll[index];
                          return CProductItem(prod: item);
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

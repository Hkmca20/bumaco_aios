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
      body: SafeArea(
          child: Column(
        children: [
          //HEADER
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                    child: Text('Bumaco',
                        style: Theme.of(context).textTheme.headline3!
                        // .copyWith(color: Colors.white),
                        //  TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                        )),
                IconButton(
                    onPressed: () {
                      Get.toNamed(wishlistRoute);
                    },
                    icon: Icon(Icons.favorite_rounded)),
                IconButton(
                    onPressed: () {
                      Get.toNamed(offerRoute);
                    },
                    icon: Icon(Icons.view_list_rounded)),
                IconButton(
                    onPressed: () {
                      productController.fetchProducts();
                    },
                    icon: Icon(Icons.grid_view_outlined)),
              ],
            ),
          ),

          //All Items Home page
          Expanded(
            child: Obx(
              () => productController.isLoading.isTrue
                  ? LoadingWidget()
                  : StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 12,
                      itemCount: productController.productList.length,
                      itemBuilder: (context, index) {
                        return AProductTile(
                            prod: productController.productList[index]);
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

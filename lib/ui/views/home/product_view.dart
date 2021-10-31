import 'dart:ui';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/bucket_controller.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/checkout/bucket_view.dart';
import 'package:bumaco_aios/ui/views/filters/filter_view.dart';
import 'package:bumaco_aios/ui/views/home/banners/cbanner.dart';
import 'package:bumaco_aios/ui/views/search/search_view.dart';
import 'package:bumaco_aios/ui/widgets/cproduct_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'favourite_view.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.to;
    final bController = BucketController.to;
    // final bucketController = Get.find<BucketController>();
    final _screenSize = MediaQuery.of(context).size;

    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppbarHome(
          title: productController.categoryItem.category,
          actionList: [
            IconButton(
              icon: Icon(Icons.search_rounded),
              tooltip: 'search'.tr,
              onPressed: () {
                Get.to(() => SearchView());
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite_border_outlined),
              tooltip: 'Wish List',
              onPressed: () {
                Get.to(() => FavouriteView());
                // Get.toNamed(wishlistRoute);
              },
            ), //IconB
            // IconButton(
            //   onPressed: () {
            //     print(productController.columnCount);
            //     productController.columnCount.value == 2
            //         ? productController.changeColumnCount(1)
            //         : productController.changeColumnCount(2);
            //   },
            //   // tooltip: 'List Item',
            //   icon: Obx(() => Icon(productController.columnCount.value == 2
            //       ? Icons.view_list_rounded
            //       : Icons.grid_view_outlined)),
            // ),
            IconButton(
              icon: Obx(
                () => bController.bucketList.length == 0
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
                          child: bController.bucketList.length.text
                              .size(11)
                              .white
                              .make()
                              .centered(),
                        ),
                      ]),
              ),
              tooltip: 'view_cart_item'.tr,
              onPressed: () {
                Get.to(() => BucketView());
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CBannerWidget(productController: productController),
                SizedBox(height: 2),
                // VxSwiper.builder(
                //   itemCount: 10,
                //   height: 400,
                //   autoPlay: true,
                //   itemBuilder: (context, index) {
                //     return "Item $index"
                //         .text
                //         .white
                //         .make()
                //         .box
                //         .rounded
                //         .alignCenter
                //         .color(Vx.randomOpaqueColor)
                //         .make()
                //         .p4();
                //   },
                // ),
                // VxSwiper.builder(
                //   itemCount: 10,
                //   height: 400,
                //   aspectRatio: 16 / 9,
                //   viewportFraction: 0.8,
                //   initialPage: 0,
                //   enableInfiniteScroll: true,
                //   reverse: false,
                //   autoPlay: true,
                //   autoPlayInterval: Duration(seconds: 3),
                //   autoPlayAnimationDuration: Duration(milliseconds: 800),
                //   autoPlayCurve: Curves.fastOutSlowIn,
                //   enlargeCenterPage: true,
                //   isFastScrollingEnabled: false,
                //   // onPageChanged: callbackFunction,
                //   scrollDirection: Axis.horizontal,
                //   itemBuilder: (context, index) {
                //     return "Item $index"
                //         .text
                //         .white
                //         .make()
                //         .box
                //         .rounded
                //         .alignCenter
                //         .color(Vx.randomOpaqueColor)
                //         .make()
                //         .p4();
                //   },
                // ),
                // List.generate(
                //     5,
                //     (index) => "Item $index"
                //         .text
                //         .white
                //         .make()
                //         .box
                //         .rounded
                //         .alignCenter
                //         .color(Vx.randomOpaqueColor)
                //         .make()
                //         .p4()).swiper(
                //     height: context.isMobile ? 200 : 400,
                //     enlargeCenterPage: true,
                //     onPageChanged: (index) {
                //       print(index);
                //     },
                //     isFastScrollingEnabled: true,
                //     scrollDirection:
                //         context.isMobile ? Axis.horizontal : Axis.horizontal),
                // BannerCarousel(
                //   fitImage: BoxFit.fill,
                //   animation: true,
                //   banners: productController.bannerList,
                //   onTap: (id) => print(id),
                // ),
                SizedBox(height: 10),
                Obx(
                  () =>
                      '${productController.categoryItem.category} | ${productController.allProductList.length} products'
                          .text
                          .size(18)
                          .fontWeight(FontWeight.w600)
                          .make()
                          .p16(),
                ),
                SizedBox(height: 10),
                VxDivider(),
                Container(
                  width: _screenSize.width,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: kGreyLightColor),
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                  child: HStack(
                    [
                      InkWell(
                        onTap: () {},
                        child: HStack(
                          [
                            Icon(Icons.sort).p12(),
                            VStack([
                              'Sort By'.text.bold.make(),
                              'Popularity'.text.size(12).make(),
                            ]).p12(),
                          ],
                          alignment: MainAxisAlignment.start,
                          crossAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                      Container(
                        height: 30,
                        child: VerticalDivider(color: kGreyLightColor),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => FilterView());
                        },
                        child: HStack([
                          Icon(Icons.center_focus_strong_outlined).p12(),
                          VStack([
                            'Filter'.text.bold.make(),
                            'Apply Filters'.text.size(12).make(),
                          ]).p12(),
                        ]),
                      )
                    ],
                    alignment: MainAxisAlignment.spaceEvenly,
                    crossAlignment: CrossAxisAlignment.center,
                  ),
                ),
                // Wrap(
                //   spacing: 3,
                //   runSpacing: 3,
                //   children: List.generate(
                //     1,
                //     (index) {
                //       return Row(children: [
                //         ListTile(
                //           title: 'Sort By'.text.bold.make(),
                //           subtitle: 'Popularity'.text.make(),
                //         ),
                //         ListTile(
                //           title: 'Sort By'.text.bold.make(),
                //           subtitle: 'Popularity'.text.make(),
                //         ),
                //       ]);
                //     },
                //   ),
                // ),
                Container(
                  child: Obx(
                    () => productController.isLoading.isTrue
                        ? LoadingWidget()
                        : StaggeredGridView.count(
                            padding: EdgeInsets.all(4),
                            // controller: productController.scroll,
                            crossAxisCount: productController.columnCount.value,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            staggeredTiles: List.generate(
                                productController.allProductList.length,
                                (index) {
                              return StaggeredTile.fit(1);
                            }),
                            children: List.generate(
                                productController.allProductList.length,
                                (index) {
                              final item =
                                  productController.allProductList[index];
                              return CProductTile(
                                prod: item,
                                bController: bController,
                                pController: productController,
                                index: index,
                                offset: productController.offset.value,
                              );
                            }),
                            //-----------------------hari practice 5-----gridviewcount-------
                            // children: [
                            //   'https://via.placeholder.com/150',
                            //   'https://via.placeholder.com/150',
                            //   'https://via.placeholder.com/150',
                            //   'https://via.placeholder.com/150',
                            //   'https://via.placeholder.com/150',
                            //   'https://via.placeholder.com/150',
                            // ].map((String url) {
                            //   return Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       Flexible(
                            //         child: GridView.count(
                            //             crossAxisCount: 4,
                            //             childAspectRatio: 1.0,
                            //             padding: const EdgeInsets.all(4.0),
                            //             mainAxisSpacing: 4.0,
                            //             crossAxisSpacing: 4.0,
                            //             children: [
                            //               'https://via.placeholder.com/150',
                            //               'https://via.placeholder.com/150',
                            //               'https://via.placeholder.com/150',
                            //               'https://via.placeholder.com/150',
                            //               'https://via.placeholder.com/150',
                            //               'https://via.placeholder.com/150',
                            //             ].map((String url) {
                            //               return GridTile(
                            //                 child: Image.network(url,
                            //                     fit: BoxFit.cover),
                            //               );
                            //             }).toList()),
                            //       ),
                            //     ],
                            //   );
                            // }).toList(),
                            //-----------------------hari practice 4-----gridviewcount-------
//                            children: [
//                               'https://via.placeholder.com/150',
//                               'https://via.placeholder.com/150',
//                               'https://via.placeholder.com/150',
//                               'https://via.placeholder.com/150',
//                               'https://via.placeholder.com/150',
//                               'https://via.placeholder.com/150',
//                             ].map((String url) {
//                               return GridTile(
//                                   child: new Image.network(url,
//                                       fit: BoxFit.cover));
//                             }).toList(),
                            //-----------------------hari practice 3-----gridviewcount-------
                            //children: [
                            //   'https://via.placeholder.com/150',
                            //   'https://via.placeholder.com/150',
                            //   'https://via.placeholder.com/150',
                            //   'https://via.placeholder.com/150',
                            //   'https://via.placeholder.com/150',
                            //   'https://via.placeholder.com/150',
                            // ].map((String url) {
                            //   return Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       Flexible(
                            //         child: new GridView.count(
                            //             crossAxisCount: 4,
                            //             childAspectRatio: 1.0,
                            //             padding: const EdgeInsets.all(4.0),
                            //             mainAxisSpacing: 4.0,
                            //             crossAxisSpacing: 4.0,
                            //             children: <String>[
                            //               'https://via.placeholder.com/150',
                            //               'https://via.placeholder.com/150',
                            //               'https://via.placeholder.com/150',
                            //               'https://via.placeholder.com/150',
                            //               'https://via.placeholder.com/150',
                            //               'https://via.placeholder.com/150',
                            //             ].map((String url) {
                            //               return GridTile(
                            //                   child: Image.network(url,
                            //                       fit: BoxFit.cover));
                            //             }).toList()),
                            //       ),
                            //     ],
                            //   );
                            // }).toList(),
                            //-----------------------hari practice 1-----staggeredgridviewbuilder-------
                            // itemCount: productController.allProductList.length,
                            // staggeredTileBuilder: (int index) {
                            //   return StaggeredTile.fit(1);
                            // },
                            // itemBuilder: (context, index) {
                            //   ProductModel item =
                            //       productController.allProductList[index];
                            //   return CProductTile(
                            //     bController: bController,
                            //     pController: productController,
                            //     prod: item,
                            //     index: index,
                            //     offset: productController.offset.value,
                            //   );
                            // },
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

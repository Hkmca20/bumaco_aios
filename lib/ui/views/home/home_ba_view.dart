import 'dart:ui';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar_shome.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/banner_controller.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/home/banners/cbanner_home.dart';
import 'package:bumaco_aios/ui/views/home/item_widget_11.dart';
import 'package:bumaco_aios/ui/views/search/search_view.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';

import '../checkout/bucket_view.dart';
import 'banners/a_t_obanner.dart';
import 'favourite_view.dart';

class A9GateCategory extends StatelessWidget {
  const A9GateCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: 'How to select or find a product'.text.bold.make().p4(),
      subtitle:
          'This is contains of 9 gates, You may select a gate from category list and enter you will find a sub category gate then search any product you required.'
              .text
              .make()
              .p4(),
      children: <Widget>[
        ListTile(title: Text('Find your products')),
      ],
    );
  }
}

class HomeBaView extends StatelessWidget {
  HomeBaView({Key? key}) : super(key: key);

  final bannerController = BannerController.to;
  final homeController = HomeController.to;
  // final bController = Get.find<BucketController>();
  final bController = BucketController.to;
  final cController = CategoryController.to;
  final box = GetStorage(BOX_APP);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    // Widget createDrawerHeader() {
    //   return DrawerHeader(
    //       margin: EdgeInsets.zero,
    //       padding: EdgeInsets.zero,
    //       decoration: BoxDecoration(
    //           image:
    //               DecorationImage(fit: BoxFit.fill, image: NetworkImage(''))),
    //       child: Stack(children: <Widget>[
    //         Positioned(
    //             bottom: 12.0,
    //             left: 16.0,
    //             child: Text('BEAUTY GATE',
    //                 style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 20.0,
    //                     fontWeight: FontWeight.w500))),
    //       ]));
    // }

    return Material(
      child: Scaffold(
        // floatingActionButton: Obx(
        //   () => Visibility(
        //     visible: homeController.showFAB.value,
        //     child: FloatingActionButton.extended(
        //       backgroundColor: Vx.amber500.withOpacity(0.8),
        //       onPressed: () {
        //         showBottomSheet(
        //             context: context,
        //             builder: (context) => Container(
        //                   color: Colors.red,
        //                 ));
        //       },
        //       icon: Icon(
        //         Icons.add_shopping_cart,
        //         color: kWhiteColor,
        //       ),
        //       label: Obx(
        //         () => Text(
        //           bController.bucketList.length.toString(),
        //           style: TextStyle(color: kWhiteColor, fontSize: 24),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        appBar: AppbarSHome(
          title: 'app_title'.tr,
          actionList: [
            IconButton(
              icon: Icon(Icons.favorite_border_outlined),
              tooltip: 'wishlist'.tr,
              onPressed: () {
                Get.to(() => FavouriteView());
              },
            ), //IconBnButton
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
                          child: Obx(() => bController.bucketList.length.text
                              .size(11)
                              .white
                              .make()
                              .centered()),
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
        drawer: Drawer(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  // createDrawerHeader(),
                  'BEAUTY GATE'.text.size(20).bold.make(),
                  // homeController.getSelectedGate().text.size(20).bold.make(),
                  Obx(
                    () => cController.isLoading.isTrue
                        ? LoadingWidget()
                        : ListView.separated(
                            separatorBuilder: (context, index) =>
                                Divider(indent: 55, endIndent: 20),
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: cController.categoryList.length,
                            itemBuilder: (context, index) {
                              final CategoryModel item =
                                  cController.categoryList[index];
                              return ExpansionTile(
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Container(
                                    //   margin: EdgeInsets.all(5),
                                    //   height: 40.0,
                                    //   width: 40.0,
                                    //   decoration: BoxDecoration(
                                    //     color: Colors.grey,
                                    //     boxShadow: [
                                    //       BoxShadow(
                                    //           color:
                                    //               Colors.black.withAlpha(70),
                                    //           offset: const Offset(2.0, 2.0),
                                    //           blurRadius: 2.0)
                                    //     ],
                                    //     borderRadius: BorderRadius.all(
                                    //         Radius.circular(2.0)),
                                    //     image: DecorationImage(
                                    //       image: Image.network(
                                    //               '${ApiConstants.baseImageUrl}${item.image}')
                                    //           .image,
                                    //       fit: BoxFit.cover,
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(width: 8.0),
                                    Expanded(
                                      child: item.category.text.bold
                                          .size(16)
                                          .make(),
                                    ),
                                    // Container(
                                    //   child: Icon(
                                    //     Icons.arrow_forward_ios_rounded,
                                    //     color: Colors.grey,
                                    //   ),
                                    // )
                                  ],
                                ),
                                // 'How to select or find a product'
                                //     .text
                                //     .bold
                                //     .make()
                                //     .p4(),
                                // subtitle:
                                //     'This is contains of 9 gates, You may select a gate from category list and enter you will find a sub category gate then search any product you required.'
                                //         .text
                                //         .make()
                                //         .p4(),
                                children: <Widget>[
                                  Wrap(
                                    children: List.generate(
                                        cController.dummyChildList.length,
                                        (index) {
                                      return InkWell(
                                        onTap: () {
                                          Get.back();
                                          Get.toNamed(productRoute, arguments: {
                                            'arg_category_item': CategoryModel(
                                                category: cController
                                                    .dummyChildList[index]
                                                    .category)
                                          });
                                        },
                                        child: ListTile(
                                          title: cController
                                              .dummyChildList[index]
                                              .category
                                              .text
                                              .size(16)
                                              .make()
                                              .p8(),
                                        ),
                                      );
                                    }),
                                  ),
                                  // List.generate(),
                                  // ListTile(
                                  //     title: ('Find your products')
                                  //         .text
                                  //         .make()
                                  //         .p4()),
                                ],
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Obx(
          () => bannerController.isLoading.isTrue
              ? Column(children: [
                  SizedBox(
                    height: 100,
                    child: VxShimmer(
                      child: 'loading_data'.tr.text.size(30).center.make(),
                    ).centered(),
                  ),
                  LoadingWidget()
                ])
              : SingleChildScrollView(
                  // controller: homeController.scrollController,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(),
                    child: Column(children: [
                      Container(
                        height: 60,
                        padding: EdgeInsets.all(12),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => SearchView());
                          },
                          // child: Container(color: kPrimaryColor,),
                          child: TextFormField(
                            scrollPhysics: NeverScrollableScrollPhysics(),
                            enabled: false,
                            decoration: InputDecoration(
                                fillColor: Colors.black.withOpacity(0.1),
                                filled: true,
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Search on Bumaco',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: kGreyLightColor),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none),
                                contentPadding: EdgeInsets.all(2)),
                          ),
                        ),
                      ),
                      Divider(),
                      // Container(
                      //   height: 110,
                      //   child: ListView.builder(
                      //     physics: ClampingScrollPhysics(),
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: cController.categoryList.length,
                      //     itemBuilder: (context, index) {
                      //       final CategoryModel item =
                      //           cController.categoryList[index];
                      //       return Card(
                      //         color: Colors.primaries[
                      //                 Random().nextInt(Colors.primaries.length)]
                      //             .withOpacity(0.3)
                      //         // [Random().nextInt(9) * 100]
                      //         ,
                      //         child: InkWell(
                      //           child: Column(
                      //             children: [
                      //               Flexible(
                      //                 child: Container(
                      //                   height: 100,
                      //                   width: _screenSize.width / 4,
                      //                   child: ClipRRect(
                      //                     borderRadius: BorderRadius.all(
                      //                         Radius.circular(4)),
                      //                     child: FadeInImage.memoryNetwork(
                      //                       placeholder: kTransparentImage,
                      //                       image: ApiConstants.baseImageUrl +
                      //                           item.image,
                      //                       fit: BoxFit.cover,
                      //                     ),
                      //                   ),
                      //                   decoration: BoxDecoration(
                      //                     color: Colors.transparent,
                      //                     borderRadius: BorderRadius.all(
                      //                         Radius.circular(4)),
                      //                   ),
                      //                 ),
                      //               ),
                      //               item.category.text.capitalize
                      //                   .size(16)
                      //                   .make()
                      //                   .p2(),
                      //             ],
                      //           ),
                      //           onTap: () {
                      //             Get.toNamed(productRoute, arguments: {
                      //               'arg_category_item':
                      //                   CategoryModel(category: item.category)
                      //             });
                      //             // Get.toNamed(cProductRoute, arguments: {
                      //             //   'arg_category_item': CategoryModel(category: item.category)
                      //             // });
                      //           },
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // Divider(),
                      CBannerHomeWidget(
                        bannerHeight: 110.0,
                        fitImage: BoxFit.fill,
                        autoscroll: true,
                        bannerList:
                            bannerController.bannerPositionList[0].bannerlist!,
                      ),
                      Divider(),
                      Wrap(
                        spacing: 3,
                        runSpacing: 3,
                        children: List.generate(
                            bannerController.bannerPositionList[1].bannerlist!
                                .length, (index) {
                          final BannerModel item = bannerController
                              .bannerPositionList[1].bannerlist![index];
                          return ItemWidget11(
                              padding: EdgeInsets.only(left: 0.0),
                              screenWidth: _screenSize.width - 20,
                              item: item);
                        }),
                      ),
                      Divider(),

                      SectionTile(title: 'IN THE SPOTLIGHT'),
                      Wrap(
                        spacing: 3,
                        runSpacing: 3,
                        children: List.generate(
                            bannerController.bannerPositionList[2].bannerlist!
                                .length, (index) {
                          final BannerModel item = bannerController
                              .bannerPositionList[2].bannerlist![index];
                          return ItemWidget11(
                              padding: EdgeInsets.only(left: 0.0),
                              screenWidth: _screenSize.width - 20,
                              item: item);
                        }),
                      ),
                      Divider(),
                      Wrap(
                        spacing: 3,
                        runSpacing: 3,
                        children: List.generate(
                            bannerController.bannerPositionList[3].bannerlist!
                                .length, (index) {
                          final BannerModel item = bannerController
                              .bannerPositionList[3].bannerlist![index];
                          return ItemWidget11(
                              padding: EdgeInsets.only(left: 0.0),
                              screenWidth: _screenSize.width - 20,
                              item: item);
                        }),
                      ),
                      Divider(),
                      SectionTile(title: 'ONLY AT NYKAA'),
                      Wrap(
                        spacing: 3,
                        runSpacing: 3,
                        children: List.generate(
                            bannerController.bannerPositionList[4].bannerlist!
                                .length, (index) {
                          final BannerModel item = bannerController
                              .bannerPositionList[4].bannerlist![index];
                          return ItemWidget11(
                              padding: EdgeInsets.only(left: 0.0),
                              screenWidth: _screenSize.width / 2 - 10,
                              item: item);
                        }),
                      ),
                      Divider(),
                      SectionTile(title: 'TRENDING STORES & GUIDE'),
                      Container(
                        height: 200,
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: bannerController
                                .bannerPositionList[5].bannerlist!.length,
                            itemBuilder: (context, index) {
                              final BannerModel item = bannerController
                                  .bannerPositionList[5].bannerlist![index];
                              EdgeInsets _padding = index == 0
                                  ? const EdgeInsets.only(
                                      left: 10.0, right: 0.0)
                                  : const EdgeInsets.only(
                                      left: 0.0, right: 10.0);

                              return ItemWidget11(
                                  padding: _padding,
                                  screenWidth: _screenSize.width - 60,
                                  item: item);
                            }),
                      ),
                      Divider(),
                      SectionTile(title: 'FEATURED BRAND'),
                      Wrap(
                        spacing: 3,
                        runSpacing: 3,
                        children: List.generate(
                            bannerController.bannerPositionList[6].bannerlist!
                                .length, (index) {
                          final BannerModel item = bannerController
                              .bannerPositionList[6].bannerlist![index];
                          return ItemWidget11(
                              padding: EdgeInsets.only(left: 0.0),
                              screenWidth: _screenSize.width / 2 - 20,
                              item: item);
                        }),
                      ),
                      Divider(),
                      Wrap(
                        spacing: 3,
                        runSpacing: 3,
                        children: List.generate(
                            bannerController.bannerPositionList[7].bannerlist!
                                .length, (index) {
                          final BannerModel item = bannerController
                              .bannerPositionList[7].bannerlist![index];
                          return ItemWidget11(
                              padding: EdgeInsets.only(left: 0.0),
                              screenWidth: _screenSize.width / 2 - 20,
                              item: item);
                        }),
                      ),
                      Divider(),
                      SectionTile(title: 'CATEGORY IN FOCUS'),
                      Wrap(
                        spacing: 3,
                        runSpacing: 3,
                        children: List.generate(
                            bannerController.bannerPositionList[8].bannerlist!
                                .length, (index) {
                          final BannerModel item = bannerController
                              .bannerPositionList[8].bannerlist![index];
                          return ItemWidget11(
                              padding: EdgeInsets.only(left: 0.0),
                              screenWidth: _screenSize.width - 20,
                              item: item);
                        }),
                      ),
                      Divider(),
                      SectionTile(title: 'HIDDEN GEMS'),
                      Wrap(
                        spacing: 3,
                        runSpacing: 3,
                        children: List.generate(
                            bannerController.bannerPositionList[9].bannerlist!
                                .length, (index) {
                          final BannerModel item = bannerController
                              .bannerPositionList[9].bannerlist![index];
                          return ItemWidget11(
                              padding: EdgeInsets.only(left: 0.0),
                              screenWidth: _screenSize.width / 2 - 20,
                              item: item);
                        }),
                      ),
                      Divider(),
                      SectionTile(title: 'EDITOR\'S CHOICE'),
                      Container(
                        height: _screenSize.width / 2,
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: bannerController
                                .bannerPositionList[10].bannerlist!.length,
                            itemBuilder: (context, index) {
                              final BannerModel item = bannerController
                                  .bannerPositionList[10].bannerlist![index];
                              EdgeInsets _padding = index == 0
                                  ? const EdgeInsets.only(
                                      left: 10.0, right: 0.0)
                                  : const EdgeInsets.only(
                                      left: 0.0, right: 10.0);

                              return ItemWidget11(
                                  padding: _padding,
                                  screenWidth: _screenSize.width / 2,
                                  item: item);
                            }),
                      ),
                      Divider(),
                      Wrap(
                        spacing: 3,
                        runSpacing: 3,
                        children: List.generate(
                            bannerController.bannerPositionList[11].bannerlist!
                                .length, (index) {
                          final BannerModel item = bannerController
                              .bannerPositionList[11].bannerlist![index];
                          return ItemWidget11(
                              padding: EdgeInsets.only(left: 0.0),
                              screenWidth: _screenSize.width - 20,
                              item: item);
                        }),
                      ),
                      Divider(),
                      // SectionTile(title: 'MORE OFFERS FOR YOU'),
                      // Wrap(
                      //   spacing: 3,
                      //   runSpacing: 3,
                      //   children: List.generate(
                      //       bannerController.bannerPositionList[12].bannerlist!
                      //           .length, (index) {
                      //     final BannerModel item = bannerController
                      //         .bannerPositionList[12].bannerlist![index];
                      //     return ATOBanner(item: item);
                      //   }),
                      // ),
                      // Divider(),
                      // SizedBox(height: 8), //--------------------------
                      // Container(
                      //   height: 130,
                      //   child: ListView.builder(
                      //       physics: ClampingScrollPhysics(),
                      //       scrollDirection: Axis.horizontal,
                      //       itemCount: bannerController.sliderList.length,
                      //       itemBuilder: (context, index) {
                      //         final BannerModel item =
                      //             bannerController.sliderList[index];
                      //         EdgeInsets _padding = index == 0
                      //             ? const EdgeInsets.only(left: 20.0, right: 0.0)
                      //             : const EdgeInsets.only(left: 0.0, right: 0.0);

                      //         return ItemWidget11(
                      //             padding: _padding,
                      //             screenWidth: _screenSize.width,
                      //             item: item);
                      //       }),
                      // ),
                      //Category ends here-------------------------

                      //Start carousel here-------------------------
                      // Divider(),
                      // SizedBox(height: 4), //--------------------------
                      // SectionTile(title: 'new_category'.tr),
                      // CarouselSlider(
                      //   options: CarouselOptions(
                      //       autoPlay: true,
                      //       aspectRatio: 2.0,
                      //       viewportFraction: 1.0,
                      //       autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      //       autoPlayInterval: Duration(milliseconds: 5000),
                      //       enlargeCenterPage: true,
                      //       enlargeStrategy: CenterPageEnlargeStrategy.height,
                      //       enableInfiniteScroll: true),
                      //   items: bannerController.sliderList
                      //       .map((element) => HeroCarouselCard11(
                      //             category: element,
                      //           ))
                      //       .toList(),
                      // ),
                      //Ends carousel here-------------------------

                      // Divider(),
                      // SizedBox(height: 10), //--------------------------
                      // SectionTile(title: 'trending_products'.tr),
                      // Container(
                      //   height: 160,
                      //   child: ListView.builder(
                      //       physics: ClampingScrollPhysics(),
                      //       scrollDirection: Axis.horizontal,
                      //       itemCount: bannerController.sliderList.length,
                      //       itemBuilder: (context, index) {
                      //         final BannerModel item =
                      //             bannerController.sliderList[index];
                      //         EdgeInsets _padding = index == 0
                      //             ? const EdgeInsets.only(
                      //                 left: 20.0, right: 0.0)
                      //             : const EdgeInsets.only(
                      //                 left: 0.0, right: 0.0);

                      //         return ItemWidget22(
                      //             padding: _padding,
                      //             item: item,
                      //             screenWidth: _screenSize.width);
                      //       }),
                      // ),

                      // SectionTile(title: 'new_arrival_products'.tr),
                      // SectionTile(title: 'category_based_on_profile'.tr),
                      // Divider(),
                      // SizedBox(height: 10), //--------------------------
                      // SectionTile(title: 'new_arrival_products'.tr),
                      // Container(
                      //   height: _screenSize.width / 3,
                      //   child: ListView.builder(
                      //       physics: ClampingScrollPhysics(),
                      //       scrollDirection: Axis.horizontal,
                      //       itemCount: bannerController.categoryList.length,
                      //       itemBuilder: (context, index) {
                      //         final CategoryModel item =
                      //             bannerController.categoryList[index];
                      //         EdgeInsets _padding = index == 0
                      //             ? const EdgeInsets.only(left: 10.0, right: 0.0)
                      //             : const EdgeInsets.only(left: 10.0, right: 0.0);

                      //         return ItemWidget3(
                      //             padding: _padding,
                      //             screenWidth: _screenSize.width,
                      //             item: item);
                      //       }),
                      // ),
                      // Divider(),
                      // SizedBox(height: 10), //--------------------------
                      // SectionTile(title: 'best_sellers'.tr),
                      // Wrap(
                      //   children: List.generate(bannerController.categoryList.length,
                      //       (index) {
                      //     final CategoryModel item =
                      //         bannerController.categoryList[index];
                      //     return SampleAvatar(
                      //         item: item, padding: EdgeInsets.all(10.0));
                      //   }),
                      // ),
                      // Divider(),
                      // Wrap(
                      //   spacing: 3,
                      //   runSpacing: 3,
                      //   children: List.generate(bannerController.categoryList.length,
                      //       (index) {
                      //     final CategoryModel item =
                      //         bannerController.categoryList[index];
                      //     return ItemWidget1(
                      //         padding: EdgeInsets.only(left: 10.0),
                      //         screenWidth: _screenSize.width - 50,
                      //         item: item);
                      //   }),
                      // ),
                      // Divider(),
                      // SizedBox(height: 10), //--------------------------
                      // SectionTile(title: 'popular_products'.tr),
                      // Divider(),
                      // SizedBox(height: 10), //--------------------------
                      // SectionTile(title: 'trending_products'.tr),
                      // Container(
                      //   child: GridView.count(
                      //     crossAxisCount: 2,
                      //     shrinkWrap: true,
                      //     physics: NeverScrollableScrollPhysics(),
                      //     padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                      //     children: List.generate(
                      //         productController.allProductList.length, (index) {
                      //       final item =
                      //           productController.allProductList[index];
                      //       return Container(
                      //         child: Card(
                      //           clipBehavior: Clip.antiAlias,
                      //           child: InkWell(
                      //               onTap: () {
                      //                 print('----card onClick event');
                      //                 // mBanner(
                      //                 //     context: context,
                      //                 //     title: 'Brand: ' + item.brand,);
                      //               },
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   Flexible(
                      //                       child: Container(
                      //                     height: double.infinity,
                      //                     width: double.infinity,
                      //                     decoration: BoxDecoration(
                      //                         image: DecorationImage(
                      //                             image: NetworkImage(
                      //                                 ApiConstants
                      //                                         .baseImageUrl +
                      //                                     item.fimage),
                      //                             fit: BoxFit.cover)),
                      //                   )),
                      //                   item.product.text.capitalize
                      //                       .size(16)
                      //                       .fontWeight(FontWeight.w900)
                      //                       .make()
                      //                       .p2(),
                      //                   (item.shortDescription +
                      //                           ' (\$' +
                      //                           item.mrp +
                      //                           ')')
                      //                       .text
                      //                       .capitalize
                      //                       .size(12)
                      //                       .fontWeight(FontWeight.w700)
                      //                       .make()
                      //                       .p2(),
                      //                   TextButton(
                      //                     onPressed: () {
                      //                       bController.insertBucket(item);
                      //                     },
                      //                     child: 'add_to_cart'
                      //                         .tr
                      //                         .text
                      //                         .amber700
                      //                         .make()
                      //                         .centered(),
                      //                   ),
                      //                 ],
                      //               )),
                      //         ),
                      //       );
                      //     }),
                      //   ),
                      // ),

                      SizedBox(height: 100), //--------------------------
                    ]),
                  ),
                ),
        ),
      ),
    );
  }
}

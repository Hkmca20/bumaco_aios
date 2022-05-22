import 'dart:ui';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar_shome.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/banner_controller.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/home/banners/cbanner_home.dart';
import 'package:bumaco_aios/ui/views/home/item_widget_11.dart';
import 'package:bumaco_aios/ui/widgets/cproduct_item.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeBaView extends StatelessWidget {
  HomeBaView({Key? key}) : super(key: key);

  final bannerController = BannerController.to;
  final networkController = NetworkController.to;
  final homeController = HomeController.to;
  final bController = BucketController.to;
  final pController = ProductController.to;
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
        floatingActionButton: Obx(() => Visibility(
              visible: homeController.showFAB.isTrue,
              child: FloatingActionButton(
                backgroundColor: Vx.amber500.withOpacity(0.8),
                onPressed: () {
                  homeController.scrollController.animToTop();
                },
                child: Icon(
                  Icons.arrow_upward_outlined,
                  color: kWhiteColor,
                ),
              ),
            )),
        appBar: AppbarSHome(
          title: 'app_title'.tr,
          actionList: [
            IconButton(
              icon: Obx(() => pController.productListFavourite.length == 0
                  ? Icon(Icons.favorite_border_outlined)
                  : Icon(Icons.favorite_border_outlined).p4().badge(
                      count: pController.productListFavourite.length,
                      color: kPrimaryColor,
                      size: 12)),
              tooltip: 'wishlist'.tr,
              onPressed: () {
                Get.toNamed(favouriteRoute);
              },
            ), //IconBnButton
            IconButton(
              icon: Obx(() => bController.bucketList.length == 0
                  ? Icon(Icons.shopping_bag_outlined)
                  : Icon(Icons.shopping_bag_outlined).p4().badge(
                      count: bController.bucketList.length,
                      color: kPrimaryColor,
                      size: 12)),
              tooltip: 'view_cart_item'.tr,
              onPressed: () {
                Get.toNamed(bucketRoute);
              },
            ),

            // PopupMenuButton(
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            //     child: Text("Menu"),
            //   ),
            //   icon: Icon(Icons.more_horiz),
            //   color: Colors.yellowAccent,
            //   elevation: 40,
            //   shape: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.grey, width: 2)),
            //   itemBuilder: (context) => [
            //     PopupMenuItem(
            //       child: Text("First"),
            //       value: 1,
            //     ),
            //     PopupMenuItem(
            //       child: Text("Second"),
            //       value: 2,
            //     ),
            //   ],
            // ),
          ],
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            // controller: homeController.scrollController,
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  // createDrawerHeader(),
                  HStack([
                    ImageIcon(AssetImage(logo100Path)).p4(),
                    Obx(
                      () => homeController.selectedGate.value.text.xl2
                          .make()
                          .p4(),
                    ),
                  ]),
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
                              final CategoryData item =
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
                                      child: item.category.text.lg.wider.make(),
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
                                          Get.toNamed(cProductRoute,
                                              arguments: {
                                                ARG_CATEGORY_ITEM: CategoryData(
                                                    id: cController
                                                        .dummyChildList[index]
                                                        .id,
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
                                              .base
                                              .wider
                                              .gray500
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
                  HeightBox(50),
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
                      child: 'loading_data'.tr.text.xl2.center.make(),
                    ).centered(),
                  ),
                  LoadingWidget(),
                ])
              : networkController.connectionType == 0
                  ? EmptyFailureNoInternetView(
                      image: noInternetLottie,
                      title: 'Network Error',
                      description: 'Internet not found !!',
                      buttonText: "Retry",
                      onPressed: () {
                        bannerController.fetchBanners();
                        if (cController.categoryList.length == 0)
                          cController.fetchCategory();
                      },
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        bannerController.fetchBanners();
                        if (cController.categoryList.length == 0)
                          cController.fetchCategory();
                      },
                      child: SingleChildScrollView(
                        controller: homeController.scrollController,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(),
                          child: Column(children: [
                            Container(
                              height: 40,
                              margin: EdgeInsets.all(12),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(cSearchRoute);
                                },
                                child: TextFormField(
                                  scrollPhysics: NeverScrollableScrollPhysics(),
                                  enabled: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.black.withOpacity(0.1),
                                    filled: true,
                                    prefixIcon: Icon(Icons.search),
                                    hintText: 'Search on ' + 'app_title'.tr,
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: kGreyLightColor),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: EdgeInsets.all(2),
                                  ),
                                ),
                              ),
                            ),
                            Divider(),
                            cController.categoryList.length == 0
                                ? EmptyFailureNoInternetView(
                                    image: girlFaceLottie,
                                    title: 'Slow netowrk',
                                    description: 'Try reload category',
                                    buttonText: "Retry",
                                    onPressed: () {
                                      bannerController.fetchBanners();
                                      if (cController.categoryList.length == 0)
                                        cController.fetchCategory();
                                    },
                                  )
                                : Container(
                                    height: 110,
                                    child: ListView.builder(
                                      physics: ClampingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          cController.categoryList.length,
                                      itemBuilder: (context, index) {
                                        final CategoryData item =
                                            cController.categoryList[index];
                                        return Card(
                                          color:
                                              kPrimaryLightColor.withOpacity(1),
                                          child: InkWell(
                                            child: Column(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                    height: 100,
                                                    width:
                                                        _screenSize.width / 3,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  4)),
                                                      child: FadeInImage
                                                          .memoryNetwork(
                                                        placeholder:
                                                            kTransparentImage,
                                                        image: ApiConstants
                                                                .baseImageUrl +
                                                            item.image,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  4)),
                                                    ),
                                                  ),
                                                ),
                                                item.category.text.semiBold
                                                    .black.ellipsis.sm
                                                    .maxLines(1)
                                                    .make()
                                                    .p2(),
                                              ],
                                            ),
                                            onTap: () {
                                              print(
                                                  '-----------------cat_id;${item.id}');
                                              Get.toNamed(cProductRoute,
                                                  arguments: {
                                                    ARG_CATEGORY_ITEM:
                                                        CategoryData(
                                                            id: item.id,
                                                            category:
                                                                item.category)
                                                  });
                                              // Get.toNamed(cProductRoute, arguments: {
                                              //   ARG_CATEGORY_ITEM: CategoryModel(category: item.category)
                                              // });
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                            Divider(),
                            bannerController.bannerPositionList[0].bannerlist !=
                                    null
                                ? CBannerHomeWidget(
                                    bannerHeight: 110.0,
                                    fitImage: BoxFit.fill,
                                    autoscroll: true,
                                    bannerList: bannerController
                                        .bannerPositionList[0].bannerlist!,
                                  )
                                : SizedBox(),
                            // Divider(),
                            // Wrap(
                            //   spacing: 3,
                            //   runSpacing: 3,
                            //   children: List.generate(
                            //       bannerController.bannerPositionList[1].bannerlist!
                            //           .length, (index) {
                            //     final BannerModel item = bannerController
                            //         .bannerPositionList[1].bannerlist![index];
                            //     return ItemWidget11(
                            //         padding: EdgeInsets.only(left: 0.0),
                            //         screenWidth: _screenSize.width - 20,
                            //         item: item);
                            //   }),
                            // ),
                            Divider(),
                            SectionTile(title: 'SHOP BY BRAND'),
                            Wrap(
                              spacing: 3,
                              runSpacing: 3,
                              children: List.generate(
                                  bannerController.bannerPositionList[2]
                                      .bannerlist!.length, (index) {
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
                                  bannerController.bannerPositionList[3]
                                      .bannerlist!.length, (index) {
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
                                  bannerController.bannerPositionList[4]
                                      .bannerlist!.length, (index) {
                                final BannerModel item = bannerController
                                    .bannerPositionList[4].bannerlist![index];
                                return ItemWidget11(
                                    padding: EdgeInsets.only(left: 0.0),
                                    screenWidth: _screenSize.width / 2 - 10,
                                    item: item);
                              }),
                            ),
                            Divider(),
                            SectionTile(title: 'TRENDING STORIES'),
                            Container(
                              height: 200,
                              child: ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: bannerController
                                      .bannerPositionList[5].bannerlist!.length,
                                  itemBuilder: (context, index) {
                                    final BannerModel item = bannerController
                                        .bannerPositionList[5]
                                        .bannerlist![index];
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
                                  bannerController.bannerPositionList[6]
                                      .bannerlist!.length, (index) {
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
                                  bannerController.bannerPositionList[7]
                                      .bannerlist!.length, (index) {
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
                                  bannerController.bannerPositionList[8]
                                      .bannerlist!.length, (index) {
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
                                  bannerController.bannerPositionList[9]
                                      .bannerlist!.length, (index) {
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
                                      .bannerPositionList[10]
                                      .bannerlist!
                                      .length,
                                  itemBuilder: (context, index) {
                                    final BannerModel item = bannerController
                                        .bannerPositionList[10]
                                        .bannerlist![index];
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
                                  bannerController.bannerPositionList[11]
                                      .bannerlist!.length, (index) {
                                final BannerModel item = bannerController
                                    .bannerPositionList[11].bannerlist![index];
                                return ItemWidget11(
                                    padding: EdgeInsets.only(left: 0.0),
                                    screenWidth: _screenSize.width - 20,
                                    item: item);
                              }),
                            ),
                            // Divider(),
                            // Wrap(
                            //   spacing: 3,
                            //   runSpacing: 3,
                            //   children: List.generate(
                            //       bannerController.bannerPositionList[13]
                            //           .bannerlist!.length, (index) {
                            //     final BannerModel item = bannerController
                            //         .bannerPositionList[13].bannerlist![index];
                            //     return ItemWidget11(
                            //         padding: EdgeInsets.only(left: 0.0),
                            //         screenWidth: _screenSize.width - 20,
                            //         item: item);
                            //   }),
                            // ),
                            Divider(),
                            Wrap(
                              spacing: 3,
                              runSpacing: 3,
                              children: List.generate(
                                  bannerController.bannerPositionList[14]
                                      .bannerlist!.length, (index) {
                                final BannerModel item = bannerController
                                    .bannerPositionList[14].bannerlist![index];
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
                                  bannerController.bannerPositionList[15]
                                      .bannerlist!.length, (index) {
                                final BannerModel item = bannerController
                                    .bannerPositionList[15].bannerlist![index];
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
                                  bannerController.bannerPositionList[16]
                                      .bannerlist!.length, (index) {
                                final BannerModel item = bannerController
                                    .bannerPositionList[16].bannerlist![index];
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
                                  bannerController.bannerPositionList[17]
                                      .bannerlist!.length, (index) {
                                final BannerModel item = bannerController
                                    .bannerPositionList[17].bannerlist![index];
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
                            SizedBox(height: 10), //--------------------------
                            SectionTile(title: 'trending_products'.tr),
                            pController.isLoading.isTrue
                                ? LoadingWidget()
                                : pController.productListHome.length == 0
                                    ? EmptyFailureNoInternetView(
                                        image: emptyLottie,
                                        title: 'Content unavailable',
                                        description: 'Content not found',
                                        buttonText: "Retry",
                                        onPressed: () {
                                          pController.fetchProductHome();
                                        },
                                      )
                                    : Container(
                                        // child: StaggeredGrid.count(
                                        child: StaggeredGrid.count(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 4.0,
                                          crossAxisSpacing: 4.0,
                                          // shrinkWrap: true,
                                          // physics:
                                          //     NeverScrollableScrollPhysics(),
                                          // staggeredTiles: List.generate(
                                          //     pController.productListHome
                                          //         .length, (index) {
                                          //   return StaggeredTile.fit(1);
                                          // }),
                                          // padding: EdgeInsets.only(
                                          //     top: 8, left: 8, right: 8),
                                          children: List.generate(
                                              pController.productListHome
                                                  .length, (index) {
                                            final ProductModel item =
                                                pController
                                                    .productListHome[index];
                                            return CProductItem(prod: item);
                                          }),
                                        ),
                                      ),
                            Divider(),
                            'Please be careful of fraudulent calls and SMSes!\n9Gates will never call you with offers pertaining to free gifts\nor prizes or ask for payment through any links.'
                                .text
                                .semiBold
                                .heightLoose
                                .xs
                                .align(TextAlign.center)
                                .color(kPrimaryColor)
                                .makeCentered()
                                .p12()
                                .box
                                .pink100
                                .shadow2xl
                                .border(color: kPrimaryColor)
                                .make()
                                .p16(),
                            'All rights reserved. Copyright \u00a9bumaco @2021'
                                .marquee()
                                .h(24),
                            HeightBox(10),
                            VxDash(
                              length: _screenSize.width - 120,
                              dashBorderRadius: 10,
                              dashColor: kGreyLightColor,
                              dashLength: 15,
                              dashThickness: 1,
                              dashGap: 10,
                            ).paddingAll(5),
                            HeightBox(10) //--------------------------
                          ]),
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}

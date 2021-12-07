import 'dart:ui';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/bucket_controller.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/gallery/gallery_re_view.dart';
import 'package:bumaco_aios/ui/gallery/gallery_view.dart';
import 'package:bumaco_aios/ui/shopping/more_product_item.dart';
import 'package:bumaco_aios/ui/shopping/review_item.dart';
import 'package:bumaco_aios/ui/views/checkout/bucket_view.dart';
import 'package:bumaco_aios/ui/views/dashboard/tabbar_view.dart';
import 'package:bumaco_aios/ui/views/home/cproduct_more_view.dart';
import 'package:bumaco_aios/ui/views/home/favourite_view.dart';
import 'package:bumaco_aios/ui/views/home/item_address.dart';
import 'package:bumaco_aios/ui/views/home/review_list_view.dart';
import 'package:bumaco_aios/ui/views/views.dart';
import 'package:bumaco_aios/ui/widgets/cproduct_item.dart';
import 'package:bumaco_aios/ui/widgets/star_rating.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:velocity_x/velocity_x.dart';

class CProductDetailView extends StatelessWidget {
  CProductDetailView({Key? key}) : super(key: key);
  final lController = LocaleController.to;
  final bController = BucketController.to;
  final pController = ProductController.to;
  final pdController = ProductDetailController.to;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppbarHome(
        title: pdController.productItem.product,
        actionList: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            tooltip: 'search'.tr,
            onPressed: () {
              Get.to(() => SearchView());
            },
          ),
          IconButton(
            icon: Obx(() => pController.favouriteList.length == 0
                ? Icon(Icons.favorite_border_outlined)
                : Icon(Icons.favorite_border_outlined).p4().badge(
                    count: pController.favouriteList.length,
                    color: kPrimaryColor,
                    size: 12)),
            tooltip: 'wishlist'.tr,
            onPressed: () {
              Get.to(() => FavouriteView());
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
              Get.to(() => BucketView());
            },
          ),
        ],
      ),
      body: ListView(children: [
        //Product Image section
        // CBannerWidget(productController: productController),
        InkWell(
          onTap: () {
            Get.to(() => GalleryView(),
                arguments: {'arg_product_item': pdController.productItem});
          },
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              child: CachedNetworkImage(
                imageUrl:
                    ApiConstants.baseImageUrl + pdController.productItem.fimage,
                filterQuality: FilterQuality.high,
                placeholderFadeInDuration: 1.seconds,
                fit: BoxFit.fill,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
          ),
        ),
        // CarouselSlider(
        //     options: CarouselOptions(
        //         autoPlay: true,
        //         aspectRatio: 1.5,
        //         viewportFraction: 1,
        //         enlargeCenterPage: true,
        //         enlargeStrategy: CenterPageEnlargeStrategy.height,
        //         enableInfiniteScroll: true),
        //     items: [CHeroCarouselCard(product: productItem)]),
        // HeroCarouselCard(product: productItem),

        //Product Name and Share
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: pdController.productItem.product.text
                    .fontWeight(FontWeight.w400)
                    .capitalize
                    .size(20)
                    .make(),
              ),
              InkWell(
                  onTap: () async {
                    final imageUrl = ApiConstants.baseImageUrl +
                        pdController.productItem.fimage;
                    showLoadingDialog();
                    var file =
                        await DefaultCacheManager().getSingleFile(imageUrl);
                    hideLoading();
                    final shareText = pdController.productItem.product +
                        ' (' +
                        pdController.productItem.brand +
                        ')\n' +
                        pdController.productItem.shortDescription;
                    Share.shareFiles([file.path], text: shareText);
                    // Share.share(shareText);
                  },
                  child: Icon(Icons.share_outlined).p4()),
            ],
          ),
        ),

        //Product Rating section
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: HStack([
            StarRating(
              iconsize: 16,
              rating: 4.5,
              onRatingChanged: (rating) => rating = rating,
            ),
            ' 4.6/5'.text.bold.letterSpacing(2).make().p2(),
            ' (17 Ratings)'.text.color(kGreyLightColor).make(),
          ]),
        ),

        //Product MRP section
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: 'MRP: ',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: pdController.productItem.mrp == ''
                      ? ''
                      : '${lController.selectedSymbol}${pdController.productItem.mrp}',
                  style: TextStyle(
                    fontSize: 16,
                    color: kGreyLightColor,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                TextSpan(
                  text:
                      '  ${lController.selectedSymbol}${pdController.productItem.mrp}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ]),
            ),
            Container(
                height: 20, child: VerticalDivider(color: kDarkGreyColor)),
            '20% Off'.text.size(18).bold.color(kPrimaryColor).make(),
            Expanded(child: SizedBox(width: 5))
          ]),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: 'Inclusive of all taxes'.text.gray400.make(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 10,
            totalWidth: _screenSize.width - 30,
          ),
        ),
        // Size, Weight(ml, gm etc), Shades(Shades, Colors etc.)

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: HStack([
            'Selected Size - '.text.coolGray400.make(),
            Obx(() => pdController
                .sizeChoiceList[pdController.sizeChoiceIndex.value]
                .bannertext
                .text
                .bold
                .make()),
          ]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Obx(
            () => Wrap(
              children:
                  List.generate(pdController.sizeChoiceList.length, (index) {
                final item = pdController.sizeChoiceList[index];
                return ChoiceChip(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                  shape:
                      StadiumBorder(side: BorderSide(color: kGreyLightColor)),
                  label: item.bannertext.text.make(),
                  selected: pdController.sizeChoiceIndex.value == index,
                  selectedColor: Colors.green,
                  onSelected: (bool selected) {
                    pdController.sizeChoiceIndex.value = selected ? index : 0;
                  },
                  backgroundColor: kGreyLightColor,
                  labelStyle: TextStyle(color: Colors.white),
                ).marginSymmetric(horizontal: 2);
              }),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: HStack([
            'Selected Shade - '.text.coolGray400.make(),
            Obx(() => pdController
                    .shadeChoiceList[pdController.shadeChoiceIndex.value]
                    .bannertext
                    .text
                    .bold
                    .make()
                // ' construct..'
                // String.fromCharCode(149).text.bold.make()
                ),
          ]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Obx(
            () => Wrap(
              children:
                  List.generate(pdController.shadeChoiceList.length, (index) {
                final item = pdController.shadeChoiceList[index];
                return ChoiceChip(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  label: (pdController.shadeChoiceIndex.value == index
                          ? '\u2713'
                          : ' ')
                      .text
                      .bold
                      .xl
                      .center
                      .make()
                      .box
                      .make()
                      .wh4(context),
                  selected: pdController.shadeChoiceIndex.value == index,
                  selectedColor: item.color,
                  selectedShadowColor: kGreyLightColor,
                  onSelected: (bool selected) {
                    pdController.shadeChoiceIndex.value = selected ? index : 0;
                  },
                  backgroundColor: item.color,
                  labelStyle: TextStyle(color: Colors.white),
                ).box.make();
              }),
            ),
          ),
        ),
        //ends Size(ml, gm etc), Shades(Shades, Colors etc.)
        SizedBox(height: 10),
        VxDivider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: HStack([
            'SOLD BY: '.text.gray400.make(),
            'Bumaco E Retails Pvt ltd.'.text.make()
          ]),
        ),
        VxDivider(
          color: commonGreyColor,
          width: 10,
        ),
        //Return Policy
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: HStack([
            Expanded(
              child: GestureDetector(
                onTap: () {
                  IconData icon = Icons.point_of_sale_outlined;
                  String title = '100% Authentic';
                  String message =
                      '100% Authentic, directly purchased from Nykaa Naturals.';
                  openFullDialog(context, _screenSize, icon, title, message);
                },
                child: HStack([
                  Icon(Icons.policy_rounded, color: kPrimaryColor),
                  '100% Authentic'.text.make()
                ], alignment: MainAxisAlignment.center),
              ),
            ),
            Container(
                height: 40, child: VerticalDivider(color: kDarkGreyColor)),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  IconData icon = Icons.keyboard_return_outlined;
                  String title = 'Easy Return Policy';
                  String message =
                      'Returns/replacements are accepted for unused products only in case of defects, damages during delivery, missing or wrong products delivered. Return requests can be raised on the \'My Order\' section within 15 days of delivery.';
                  openFullDialog(context, _screenSize, icon, title, message);
                },
                child: HStack([
                  Icon(Icons.repeat_rounded, color: kPrimaryColor),
                  'Return Policy'.text.make()
                ], alignment: MainAxisAlignment.center),
              ),
            ),
          ]),
        ),
        VxDivider(
          color: commonGreyColor,
          width: 10,
        ),

        //Product info
        Padding(
          padding: EdgeInsets.all(10),
          child: 'Description'.text.bold.size(16).make(),
        ),
        VxDivider(
          color: commonGreyColor,
          width: 3,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: pdController.productItem.shortDescription.text
              .fontWeight(FontWeight.w200)
              .size(16)
              .make(),
        ),
        VxDivider(),
        Padding(
          padding: EdgeInsets.all(15),
          child: HStack([
            InkWell(
                onTap: () {
                  Get.to(() => TabbarView(), arguments: {
                    'arg_product_item': pdController.productItem
                  });
                },
                child: 'READ MORE'.text.bold.size(16).make()),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.arrow_forward_ios_rounded,
                color: kPrimaryColor, size: 15)
          ], alignment: MainAxisAlignment.center),
        ),

        VxDivider(
          color: commonGreyColor,
          width: 10,
        ),

        //RATING AND REVIEW SECTION
        Padding(
          padding: EdgeInsets.all(10),
          child: 'Rating & Reviews'.text.bold.make(),
        ),
        VxDivider(),
        Padding(
          padding: EdgeInsets.all(15),
          child: HStack([
            Expanded(
              child: HStack([
                '4.6'.text.bold.xl4.make().p2(),
                '/5'.text.gray300.xl4.make().p2(),
                SizedBox(width: 2),
                VStack([
                  'Overall Rating'.text.fontWeight(FontWeight.w200).make(),
                  '27 Ratings'.text.size(12).color(kGreyLightColor).make(),
                ]).p4(),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(ratingRoute, arguments: {
                              'arg_product_item': pdController.productItem
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                  border: Border.all(color: kGreyLightColor)),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 22, vertical: 10),
                                  child: 'RATE'
                                      .text
                                      .bold
                                      .color(kPrimaryColor)
                                      .make())),
                        ))),
              ], alignment: MainAxisAlignment.center),
            ),
          ]),
        ),
        Container(
          height: 100,
          child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 5),
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: pController.allProductList.length,
              itemBuilder: (context, index) {
                final ProductModel item = pController.allProductList[index];
                return CachedNetworkImage(
                        imageUrl: ApiConstants.baseImageUrl + item.fimage)
                    .paddingSymmetric(horizontal: 5, vertical: 4)
                    .onTap(() {
                  Get.to(() => GalleryReView(),
                      arguments: {'arg_selected_index': index});
                });
              }),
        ),
        'MOST USEFUL REVIEW'.text.bold.make().p16(),
        //-----ReviewItemWidget--
        ReviewItem(),
        //------end review item--
        VxDivider(),
        InkWell(
          onTap: () {
            Get.to(() => ReviewListView(),
                arguments: {'arg_product_item': pdController.productItem});
          },
          child: Padding(
            padding: EdgeInsets.all(15),
            child: HStack([
              'READ ALL REVIEWS'.text.bold.make(),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.arrow_forward_ios_rounded,
                  color: kPrimaryColor, size: 15)
            ], alignment: MainAxisAlignment.center),
          ),
        ),
        VxDivider(
          color: commonGreyColor,
          width: 10,
        ),
        VxDivider(),

        //DELIVERY SECTION
        'Delivery options'.text.bold.make().paddingAll(12),
        VxDivider(),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: kGreyLightColor, width: 1)),
          child: HStack([
            Expanded(
                child: TextFormField(
              controller: pdController.pincodeCTR,
              onChanged: (value) => {
                pdController.pincode(value),
                pdController.avalablePincode(false)
              },
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: kGreyLightColor),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  hintText: 'Enter Pincode',
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  focusColor: kGreyLightColor),
              keyboardType: TextInputType.number,
            )),
            MaterialButton(
              onPressed: () {
                pdController.checkPincodeAvailability(context);
              },
              child: Obx(
                () => pdController.pincode.value.length > 2
                    ? 'CHECK'.text.bold.color(kPrimaryColor).make().p8()
                    : 'CHECK'.text.bold.gray500.make().p8(),
              ),
            ),
            SizedBox(width: 5),
          ]),
        ).paddingOnly(top: 15, left: 15, right: 15),
        Obx(
          () => Visibility(
            visible: pdController.avalablePincode.isTrue,
            child: ListTile(
                leading: Icon(Icons.check, color: Vx.green700),
                title:
                    'This product is available to your location and COD is acceptable'
                        .text
                        .xs
                        .green700
                        .make()),
          ),
        ),
        'Check availability of COD option, estimated delivery date for online purchase, and availability in nearby retail store'
            .text
            .xs
            .make()
            .p16(),
        VxDivider(color: commonGreyColor, width: 10),
        //Recommendation SECTION
        'More from ${pdController.productItem.brand}'
            .text
            .bold
            .make()
            .paddingAll(12),
        Container(
          height: 270,
          child: ListView.builder(
              // separatorBuilder: (context, inxex) {
              //   return VxDivider(width: 1, type: VxDividerType.vertical);
              // },
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: pController.allProductList.length,
              itemBuilder: (context, index) {
                final ProductModel item = pController.allProductList[index];
                return CMoreProductItem(
                        item: item,
                        screenSize: _screenSize,
                        lController: lController)
                    .paddingSymmetric(horizontal: 5, vertical: 4);
              }),
        ),

        VxDivider(),
        InkWell(
          onTap: () {
            Get.to(() => CProductMoreView());
          },
          child: Padding(
            padding: EdgeInsets.all(15),
            child: HStack([
              'VIEW ALL PRODUCTS'.text.bold.make(),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.arrow_forward_ios_rounded,
                  color: kPrimaryColor, size: 15)
            ], alignment: MainAxisAlignment.center),
          ),
        ),
        VxDivider(color: commonGreyColor, width: 10),
        VxDivider(),
        //Recommendation SECTION
        'Customer Also Viewed'.text.bold.make().paddingAll(12),
        Container(
          height: 270,
          child: ListView.builder(
              // separatorBuilder: (context, inxex) {
              //   return VxDivider(width: 1, type: VxDividerType.vertical);
              // },
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: pController.allProductList.length,
              itemBuilder: (context, index) {
                final ProductModel item = pController.allProductList[index];
                return CMoreProductItem(
                        item: item,
                        screenSize: _screenSize,
                        lController: lController)
                    .paddingSymmetric(horizontal: 5, vertical: 4);
              }),
        ),

        VxDivider(),
        InkWell(
          onTap: () {
            Get.to(() => CProductMoreView());
          },
          child: Padding(
            padding: EdgeInsets.all(15),
            child: HStack([
              'VIEW ALL PRODUCTS'.text.bold.make(),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.arrow_forward_ios_rounded,
                  color: kPrimaryColor, size: 15)
            ], alignment: MainAxisAlignment.center),
          ),
        ),
        VxDivider(color: commonGreyColor, width: 10),
        VxDivider(),
        //---------------section---------------------
      ]),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 15),
              Obx(
                () => IconButton(
                  icon: pdController.productItem.isFavorite.isTrue
                      ? Icon(
                          Icons.favorite_rounded,
                          color: kPrimaryColor,
                        )
                      : Icon(Icons.favorite_border),
                  onPressed: () {
                    pdController.productItem.isFavorite.isTrue
                        ? pController.removeFavourite(pdController.productItem)
                        : pController.insertFavourite(pdController.productItem);
                    pdController.productItem.isFavorite.toggle();
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.shopping_basket_rounded),
                  onPressed: () {
                    bController.insertBucket(pdController.productItem);
                  },
                  label: 'add_to_cart'
                      .tr
                      .text
                      .bold
                      .uppercase
                      .white
                      .size(20)
                      .make()
                      .p2(),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> openFullDialog(BuildContext context, Size _screenSize,
      IconData icon, String title, String message) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black87,
      builder: (_) => Material(
        type: MaterialType.transparency,
        child: VStack(
          [
            Expanded(
              flex: 4,
              child: VStack(
                [
                  Icon(
                    icon,
                    size: 40,
                    color: kPrimaryColor,
                  ).centered().p8(),
                  title.text.bold.white.center.size(24).make().centered().p8(),
                  message.text.white.center.size(18).make().centered().p16(),
                ],
                alignment: MainAxisAlignment.center,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: _screenSize.width - 50,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: kWhiteColor),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                padding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
                child: 'OK, GOT IT'
                    .text
                    .size(18)
                    .white
                    .align(TextAlign.center)
                    .make()
                    .expand(),
              ),
            ),
          ],
          crossAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}

class DotWidget extends StatelessWidget {
  final double totalWidth, dashWidth, emptyWidth, dashHeight;

  final Color dashColor;

  const DotWidget({
    this.totalWidth = 300,
    this.dashWidth = 10,
    this.emptyWidth = 5,
    this.dashHeight = 2,
    this.dashColor = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalWidth ~/ (dashWidth + emptyWidth),
        (_) => Container(
          width: dashWidth,
          height: dashHeight,
          color: dashColor,
          margin: EdgeInsets.only(left: emptyWidth / 2, right: emptyWidth / 2),
        ),
      ),
    );
  }
}

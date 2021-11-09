import 'dart:ui';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/bucket_controller.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/gallery/gallery_view.dart';
import 'package:bumaco_aios/ui/views/checkout/bucket_view.dart';
import 'package:bumaco_aios/ui/views/dashboard/tabbar_view.dart';
import 'package:bumaco_aios/ui/views/home/favourite_view.dart';
import 'package:bumaco_aios/ui/views/views.dart';
import 'package:bumaco_aios/ui/widgets/star_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:velocity_x/velocity_x.dart';

class CProductDetailView extends StatefulWidget {
  CProductDetailView({Key? key}) : super(key: key);

  @override
  State<CProductDetailView> createState() => _CProductDetailViewState();
}

class _CProductDetailViewState extends State<CProductDetailView> {
  // final bController = Get.find<BucketController>();
  final bController = BucketController.to;
  final productController = ProductController.to;
  late final ProductModel productItem;
  final commonGreyColor = Colors.grey[600]!.withOpacity(0.1);

  @override
  void initState() {
    if (Get.arguments != null) {
      productItem = Get.arguments['arg_product_item'];
    } else {
      bumacoSnackbar('alert'.tr, 'Details not found!');
      Get.back();
    }
    super.initState();
  }

  List<String> _options = ['50ml', '80ml', '130ml', '200ml'];
  int _choiceIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppbarHome(
        title: productItem.product,
        actionList: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            tooltip: 'search'.tr,
            onPressed: () {
              Get.to(() => SearchView());
            },
          ),
          IconButton(
            icon: Obx(() => productController.favouriteList.length == 0
                ? Icon(Icons.favorite_border_outlined)
                : Icon(Icons.favorite_border_outlined).p4().badge(
                    count: productController.favouriteList.length,
                    color: kPrimaryColor,
                    size: 12)),
            tooltip: 'wishlist'.tr,
            onPressed: () {
              Get.to(() => FavouriteView());
              // Get.toNamed(wishlistRoute);
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
            Get.to(() => GalleryPage(),
                arguments: {'arg_product_item': productItem});
          },
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              child: CachedNetworkImage(
                imageUrl: ApiConstants.baseImageUrl + productItem.fimage,
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
                child: productItem.product.text
                    .fontWeight(FontWeight.w400)
                    .capitalize
                    .size(20)
                    .make(),
              ),
              InkWell(
                  onTap: () async {
                    final imageUrl =
                        ApiConstants.baseImageUrl + productItem.fimage;
                    showLoadingDialog();
                    var file =
                        await DefaultCacheManager().getSingleFile(imageUrl);
                    hideLoading();
                    final shareText = productItem.product +
                        ' (' +
                        productItem.brand +
                        ')\n' +
                        productItem.shortDescription;
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
            ' (17 Ratings)'.text.make(),
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
                  text: productItem.mrp == '' ? '' : '\$${productItem.mrp}',
                  style: TextStyle(
                    fontSize: 16,
                    color: kGreyLightColor,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                TextSpan(
                  text: '  \$${productItem.mrp}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ]),
            ),
            Container(
                height: 20, child: VerticalDivider(color: kDarkGreyColor)),
            '20% Off'.text.size(16).bold.color(kPrimaryColor).make(),
            Expanded(child: SizedBox(width: 5))
          ]),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: 'Include of all taxes'.text.gray400.make(),
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: HStack([
            'Selected Size - '.text.coolGray400.make(),
            _options[_choiceIndex].text.bold.make(),
          ]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Wrap(
              children: List.generate(
                  _options.length,
                  (index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: ChoiceChip(
                          label: Text(_options[index]),
                          selected: _choiceIndex == index,
                          selectedColor: Colors.red,
                          onSelected: (bool selected) {
                            setState(() {
                              _choiceIndex = selected ? index : 0;
                            });
                          },
                          backgroundColor: Colors.green,
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ))),
        ),
        SizedBox(height: 10),
        VxDivider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: HStack([
            'SOLD BY: '.text.gray400.make(),
            'Nykaa E Retails Pvt ltd.'.text.make()
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
          child: productItem.shortDescription.text
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
                  Get.to(() => TabbarView(),
                      arguments: {'arg_product_item': productItem});
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
                '4.6'.text.bold.size(30).make().p2(),
                '/5'.text.gray300.size(32).make().p2(),
                SizedBox(width: 2),
                VStack([
                  'Overall Rating'.text.fontWeight(FontWeight.w200).make().p2(),
                  '27 Ratings'.text.size(12).color(kGreyLightColor).make().p2(),
                ]),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(ratingRoute);
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
        'MOST USEFUL REVIEW'.text.bold.make().p16(),
        VxDivider(),
        Padding(
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
        VxDivider(
          color: commonGreyColor,
          width: 10,
        ),
        VxDivider(),

        //DELIVERY SECTION
        Padding(
          padding: EdgeInsets.all(12),
          child: 'Delivery options'.text.bold.make(),
        ),
        VxDivider(),
        Padding(
          padding: EdgeInsets.all(15),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: kGreyLightColor, width: 1)),
              child: HStack([
                Expanded(
                    child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: kGreyLightColor),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintText: 'Enter Pincode',
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      focusColor: kGreyLightColor),
                )),
                'CHECK'.text.gray500.make().p8(),
                SizedBox(width: 15),
              ])),
        ),
        'Check availability of COD option, estimated delivery date for online purchase, and availability in nearby retail store'
            .text
            .make()
            .p16(),
        VxDivider(
          color: commonGreyColor,
          width: 10,
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 15),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.shopping_basket_rounded),
                  onPressed: () {
                    bController.insertBucket(productItem);
                  },
                  label: 'Add to cart'.text.bold.size(20).make().p2(),
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

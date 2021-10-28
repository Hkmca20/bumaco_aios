import 'dart:ui';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/bucket_controller.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/profile/hero_card.dart';
import 'package:bumaco_aios/ui/shopping/model/product.dart';
import 'package:bumaco_aios/ui/views/checkout/bucket_view.dart';
import 'package:bumaco_aios/ui/views/home/banners/cbanner.dart';
import 'package:bumaco_aios/ui/views/home/favourite_view.dart';
import 'package:bumaco_aios/ui/views/views.dart';
import 'package:bumaco_aios/ui/widgets/chero_carousel_card.dart';
import 'package:bumaco_aios/ui/widgets/hero_carousel_card.dart';
import 'package:bumaco_aios/ui/widgets/section_tile.dart';
import 'package:bumaco_aios/ui/widgets/star_rating.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class CProductDetailView extends StatefulWidget {
  CProductDetailView({Key? key}) : super(key: key);

  @override
  State<CProductDetailView> createState() => _CProductDetailViewState();
}

class _CProductDetailViewState extends State<CProductDetailView> {
  // final bController = Get.find<BucketController>();
  final bController = BucketController.to;
  final productController = ProductController.to;

  @override
  Widget build(BuildContext context) {
    late final ProductModel productItem;
    if (Get.arguments != null) {
      productItem = Get.arguments['arg_product_item'];
    }
    print(productItem.productUrl);
    final bucketController = BucketController.to;
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
                        child: bucketController.bucketList.length.text
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
      body: ListView(children: [
        //Product Image section
        // CBannerWidget(productController: productController),
        CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 1.5,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enableInfiniteScroll: true),
            items: [CHeroCarouselCard(product: productItem)]),
        // HeroCarouselCard(product: productItem),

        //Product Name and Share
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              productItem.product.text
                  .fontWeight(FontWeight.w400)
                  .capitalize
                  .size(20)
                  .make(),
              Icon(Icons.share_outlined),
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
            ' 4.6/5'.text.bold.letterSpacing(2).wordSpacing(2).make(),
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
          color: Colors.grey[200],
          width: 10,
        ),
        //Return Policy
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: HStack([
            Expanded(
              child: HStack([
                Icon(Icons.policy_rounded, color: kPrimaryColor),
                '100% Authentic'.text.make()
              ], alignment: MainAxisAlignment.center),
            ),
            Container(
                height: 40, child: VerticalDivider(color: kDarkGreyColor)),
            Expanded(
              child: HStack([
                Icon(Icons.repeat_rounded, color: kPrimaryColor),
                'Return Policy'.text.make()
              ], alignment: MainAxisAlignment.center),
            ),
          ]),
        ),
        VxDivider(
          color: Colors.grey[200],
          width: 10,
        ),

        //Product info
        Padding(
          padding: EdgeInsets.all(10),
          child: 'Description'.text.size(16).make(),
        ),
        VxDivider(
          color: Colors.grey[200],
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
            'READ MORE'.text.size(16).make(),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.arrow_forward_ios_rounded,
                color: kPrimaryColor, size: 15)
          ], alignment: MainAxisAlignment.center),
        ),

        VxDivider(
          color: Colors.grey[200],
          width: 10,
        ),

        Padding(
          padding: EdgeInsets.all(15),
          child: HStack([
            'Ratings & Reviews'.text.size(16).make(),
            SizedBox(width: 5),
            Icon(Icons.arrow_forward_ios_rounded,
                color: kPrimaryColor, size: 15)
          ]),
        ),
        VxDivider(),
        Padding(
          padding: EdgeInsets.all(15),
          child: HStack([
            Expanded(
              child: HStack([
                '4.6'.text.bold.size(30).make().p4(),
                '/5'.text.gray300.size(30).make().p4(),
                VStack([
                  'Overall Rating'.text.fontWeight(FontWeight.w200).make().p2(),
                  '27 Ratings'.text.size(12).make().p2(),
                ]),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: 'RATE'.text.color(kPrimaryColor).make())),
              ], alignment: MainAxisAlignment.center),
            ),
          ]),
        ),

        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 20),
        //     child: ExpansionTile(
        //       title: Text('Product Information',
        //           style: Theme.of(context).textTheme.headline5),
        //       children: [
        //         ListTile(
        //           title: Text(
        //               'Great answer - tnx! How would you have the ripple effect over the button? currently its rippling under the button.nitzanwe'
        //               'May 25 20 at 9:40  Its better to use bndoon hudsoihariok gupta r(10.0) if every border is same. – Vinoth Vino'
        //               'Jun 13 20 at 10:25',
        //               style: Theme.of(context).textTheme.bodyText1),
        //         ),
        //       ],
        //     ),
        //   ),
        //   //Delivery info
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 20),
        //     child: ExpansionTile(
        //       title: Text('Delivery Information',
        //           style: Theme.of(context).textTheme.headline5),
        //       children: [
        //         ListTile(
        //           title: Text(
        //               'Delivery - tnx! How would you have the ripple effect over the button? currently its rippling under the button.nitzanwe'
        //               'May 25 20 at 9:40  Its better to use Ravi pandey manoj: Mjoisdofsdlfl  flskdjfds sdf) if every border is same. – Vinoth Vino'
        //               'Jun 13 20 at 10:25',
        //               style: Theme.of(context).textTheme.bodyText1),
        //         )
        //       ],
        //     ),
        //   ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: kPrimaryColor,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    bController.insertBucket(productItem);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    'Add to cart',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: kPrimaryColor),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

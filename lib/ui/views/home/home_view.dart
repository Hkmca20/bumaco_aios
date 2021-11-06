import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/home/banners/a_t_banner.dart';
import 'package:bumaco_aios/ui/views/home/item_avatar.dart';
import 'package:bumaco_aios/ui/views/search/search_delegate.dart';
import 'package:bumaco_aios/ui/views/search/search_view.dart';
import 'package:bumaco_aios/ui/widgets/hero_carousel_card1.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../checkout/bucket_view.dart';
import 'favourite_view.dart';
import 'item_widget_1.dart';
import 'item_widget_2.dart';
import 'item_widget_3.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final categoryController = CategoryController.to;
    final productController = ProductController.to;
    final homeController = HomeController.to;
    final bController = Get.find<BucketController>();

    return Material(
      child: Scaffold(
        floatingActionButton: Obx(
          () => Visibility(
            visible: homeController.showFAB.value,
            child: FloatingActionButton.extended(
              backgroundColor: Vx.amber500.withOpacity(0.8),
              onPressed: () {
                showBottomSheet(
                    context: context,
                    builder: (context) => Container(
                          color: Colors.red,
                        ));
              },
              icon: Icon(
                Icons.add_shopping_cart,
                color: kWhiteColor,
              ),
              label: Obx(
                () => Text(
                  bController.bucketList.length.toString(),
                  style: TextStyle(color: kWhiteColor, fontSize: 24),
                ),
              ),
            ),
          ),
        ),
        appBar: AppbarHome(
          title: 'app_title'.tr,
          actionList: [
            IconButton(
              icon: Icon(Icons.search_rounded),
              tooltip: 'search'.tr,
              onPressed: () async {
                final CountryModel? result = await showSearch<CountryModel>(
                  context: context,
                  delegate: CustomDelegate(),
                );
                print(result!.name);
              },
            ), //IconButton
            IconButton(
              icon: Icon(Icons.share_rounded),
              tooltip: 'share'.tr,
              onPressed: () {
                Get.to(() => SearchView());
              },
            ), //Ico
            IconButton(
              icon: Icon(Icons.favorite_rounded),
              tooltip: 'wishlist'.tr,
              onPressed: () {
                Get.to(() => FavouriteView());
              },
            ), //IconBnButton
            IconButton(
              icon: Icon(Icons.shopping_cart_rounded),
              tooltip: 'view_cart_item'.tr,
              onPressed: () {
                Get.to(() => BucketView());
                // categoryController.fetchCategory();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Obx(
              () => Column(children: <Widget>[
                categoryController.isLoading.isTrue
                    ? SizedBox(
                        height: 200,
                        child: VxShimmer(
                          child: 'loading_data'.tr.text.size(30).center.make(),
                        ).centered(),
                      )
                    : SizedBox(height: 8),
                SectionTile(title: 'new_arrival_products'.tr),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 80,
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryController.categoryList.length,
                      itemBuilder: (context, index) {
                        final CategoryModel item =
                            categoryController.categoryList[index];
                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: Chip(
                            shadowColor: kPrimaryColor,
                            label: item.category.text
                                .size(20)
                                .bold
                                .amber600
                                .make(),
                            padding: EdgeInsets.all(14),
                          ),
                        );
                      }),
                ),
                Divider(),
                SectionTile(title: 'category_based_on_profile'.tr),
                SizedBox(height: 8), //--------------------------
                Container(
                  height: 130,
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryController.categoryList.length,
                      itemBuilder: (context, index) {
                        final CategoryModel item =
                            categoryController.categoryList[index];
                        EdgeInsets _padding = index == 0
                            ? const EdgeInsets.only(left: 20.0, right: 0.0)
                            : const EdgeInsets.only(left: 0.0, right: 0.0);

                        return ItemWidget1(
                            padding: _padding,
                            screenWidth: _screenSize.width,
                            item: item);
                      }),
                ),
                //Category ends here-------------------------

                //Start carousel here-------------------------
                Divider(),
                SizedBox(height: 4), //--------------------------
                SectionTile(title: 'new_category'.tr),
                CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      viewportFraction: 1.0,
                      autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      autoPlayInterval: Duration(milliseconds: 5000),
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enableInfiniteScroll: true),
                  items: categoryController.categoryList
                      .map((element) => HeroCarouselCard1(
                            category: element,
                          ))
                      .toList(),
                ),
                //Ends carousel here-------------------------

                Divider(),
                ATBanner(
                    item: BannerModel(
                  bannerimage: '20210921080915_492297.jpg',
                  image: '20210921080915_492297.jpg',
                  category: 'Great Offers',
                  hasvery: 'f0gsggg8hd',
                )),

                Divider(),
                SizedBox(height: 10), //--------------------------
                SectionTile(title: 'trending_products'.tr),
                Container(
                  height: 160,
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryController.categoryList.length,
                      itemBuilder: (context, index) {
                        final CategoryModel item =
                            categoryController.categoryList[index];
                        EdgeInsets _padding = index == 0
                            ? const EdgeInsets.only(left: 20.0, right: 0.0)
                            : const EdgeInsets.only(left: 0.0, right: 0.0);

                        return ItemWidget2(
                            padding: _padding,
                            item: item,
                            screenWidth: _screenSize.width);
                      }),
                ),

                Divider(),
                SizedBox(height: 10), //--------------------------
                SectionTile(title: 'new_arrival_products'.tr),
                Container(
                  height: _screenSize.width / 3,
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryController.categoryList.length,
                      itemBuilder: (context, index) {
                        final CategoryModel item =
                            categoryController.categoryList[index];
                        EdgeInsets _padding = index == 0
                            ? const EdgeInsets.only(left: 10.0, right: 0.0)
                            : const EdgeInsets.only(left: 10.0, right: 0.0);

                        return ItemWidget3(
                            padding: _padding,
                            screenWidth: _screenSize.width,
                            item: item);
                      }),
                ),
                Divider(),
                SizedBox(height: 10), //--------------------------
                SectionTile(title: 'best_sellers'.tr),
                Wrap(
                  children: List.generate(
                      categoryController.categoryList.length, (index) {
                    final CategoryModel item =
                        categoryController.categoryList[index];
                    return SampleAvatar(
                        item: item, padding: EdgeInsets.all(10.0));
                  }),
                ),
                Divider(),
                Wrap(
                  spacing: 3,
                  runSpacing: 3,
                  children: List.generate(
                      categoryController.categoryList.length, (index) {
                    final CategoryModel item =
                        categoryController.categoryList[index];
                    return ItemWidget1(
                        padding: EdgeInsets.only(left: 10.0),
                        screenWidth: _screenSize.width - 50,
                        item: item);
                  }),
                ),

                Divider(),
                SizedBox(height: 10), //--------------------------
                SectionTile(title: 'popular_products'.tr),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  height: 200,
                  child: Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final item = productController.allProductList[index];
                        return Card(
                          child: InkWell(
                            child: Column(
                              children: [
                                Flexible(
                                  child: Container(
                                    height: double.infinity,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            ApiConstants.baseImageUrl +
                                                item.fimage),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ),
                                item.product.text.capitalize
                                    .size(16)
                                    .fontWeight(FontWeight.w900)
                                    .make()
                                    .p2(),
                                (item.description + ' - \$' + item.mrp)
                                    .text
                                    .capitalize
                                    .size(12)
                                    .fontWeight(FontWeight.w700)
                                    .make()
                                    .p2(),
                                TextButton(
                                  onPressed: () {
                                    bController.insertBucket(item);
                                  },
                                  child: 'add_to_cart'
                                      .tr
                                      .text
                                      .amber700
                                      .make()
                                      .centered(),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                        );
                      },
                      itemCount: productController.allProductList.length,
                    ),
                  ),
                ),

                Divider(),
                SizedBox(height: 10), //--------------------------
                SectionTile(title: 'trending_products'.tr),
                Container(
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                    children: List.generate(
                        productController.allProductList.length, (index) {
                      final item = productController.allProductList[index];
                      return Container(
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                              onTap: () {
                                print('----card onClick event');
                                // mBanner(
                                //     context: context,
                                //     title: 'Brand: ' + item.brand,);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                      child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                ApiConstants.baseImageUrl +
                                                    item.fimage),
                                            fit: BoxFit.cover)),
                                  )),
                                  item.product.text.capitalize
                                      .size(16)
                                      .fontWeight(FontWeight.w900)
                                      .make()
                                      .p2(),
                                  (item.shortDescription +
                                          ' (\$' +
                                          item.mrp +
                                          ')')
                                      .text
                                      .capitalize
                                      .size(12)
                                      .fontWeight(FontWeight.w700)
                                      .make()
                                      .p2(),
                                  TextButton(
                                    onPressed: () {
                                      bController.insertBucket(item);
                                    },
                                    child: 'add_to_cart'
                                        .tr
                                        .text
                                        .amber700
                                        .make()
                                        .centered(),
                                  ),
                                ],
                              )),
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(height: 100), //--------------------------
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

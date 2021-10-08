import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/home/item_avatar.dart';
import 'package:bumaco_aios/ui/views/home/search_delegate.dart';
import 'package:bumaco_aios/ui/views/search/search_view.dart';
import 'package:bumaco_aios/ui/widgets/aproduct_card.dart';
import 'package:bumaco_aios/ui/widgets/cproduct_card.dart';
import 'package:bumaco_aios/ui/widgets/hero_carousel_card1.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

import 'item_widget_1.dart';
import 'item_widget_2.dart';
import 'item_widget_3.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final categoryController = Get.find<CategoryController>();
    final productController = Get.find<ProductController>();
    return Scaffold(
      appBar: AppbarHome(
        title: 'Bumaco',
        actionList: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            color: kPrimaryColorDark,
            tooltip: 'Search',
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
            tooltip: 'Share',
            onPressed: () {
              Get.to(() => SearchView());
            },
          ), //Ico
          IconButton(
            icon: Icon(Icons.favorite_rounded),
            tooltip: 'Wishlist',
            onPressed: () {},
          ), //IconBnButton
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            tooltip: 'View Cart Item',
            onPressed: () {
              categoryController.fetchCategory();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Obx(
            () => Column(children: <Widget>[
              SizedBox(height: 16), //--------------------------
              SectionTile(title: 'Category based on your profile'),
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
              SectionTile(title: 'New Category'),
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
              SizedBox(height: 10), //--------------------------
              SectionTile(title: 'Trending Products'),
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
              SectionTile(title: 'New Arrival Products'),
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
              SectionTile(title: 'Best Sellers'),
              Wrap(
                children: List.generate(categoryController.categoryList.length,
                    (index) {
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
                children: List.generate(categoryController.categoryList.length,
                    (index) {
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
              SectionTile(title: 'Popular Products'),
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
                                              item.shortDescription),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                padding: EdgeInsets.all(10),
                                child: item.product.text
                                    .size(12)
                                    .softWrap(true)
                                    .make(),
                              )
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
              SectionTile(title: 'Trending Products'),
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
                              print('card onClick event');
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
                                                  item.shortDescription),
                                          fit: BoxFit.cover)),
                                )),
                                ListTile(
                                  title: item.product.text
                                      .size(16)
                                      .fontWeight(FontWeight.w900)
                                      .make(),
                                  subtitle: item.description.text
                                      .size(12)
                                      .fontWeight(FontWeight.w700)
                                      .make(),
                                )
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
    );
  }
}

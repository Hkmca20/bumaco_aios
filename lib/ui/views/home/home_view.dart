import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/home/search_delegate.dart';
import 'package:bumaco_aios/ui/widgets/hero_carousel_card1.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'item_widget_1.dart';
import 'item_widget_2.dart';
import 'item_widget_3.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final categoryController = Get.find<CategoryController>();
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
              print('searchresult-------${result!.name}');
            },
          ), //IconButton
          IconButton(
            icon: Icon(Icons.share_rounded),
            color: kPrimaryColorDark,
            tooltip: 'Share',
            onPressed: () {},
          ), //Ico
          IconButton(
            icon: Icon(Icons.favorite_rounded),
            color: kPrimaryColorDark,
            tooltip: 'Wishlist',
            onPressed: () {},
          ), //IconBnButton
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            color: kPrimaryColorDark,
            tooltip: 'View Cart Item',
            onPressed: () {
              categoryController.fetchCategory();
            },
          ),
        ],
      ),
      body: Obx(
        () => ListView(children: <Widget>[
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
          SizedBox(height: 4), //--------------------------
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
                      ? const EdgeInsets.only(left: 20.0, right: 0.0)
                      : const EdgeInsets.only(left: 0.0, right: 0.0);

                  return ItemWidget3(
                      padding: _padding,
                      screenWidth: _screenSize.width,
                      item: item);
                }),
          ),

          SizedBox(height: 10), //--------------------------
          SectionTile(title: 'Best Sellers'),
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

          SizedBox(height: 100), //--------------------------
        ]),
      ),
    );
  }
}

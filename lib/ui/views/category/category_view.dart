import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/checkout/bucket_view.dart';
import 'package:bumaco_aios/ui/views/home/banners/cbanner_home.dart';
import 'package:bumaco_aios/ui/views/home/favourite_view.dart';
import 'package:bumaco_aios/ui/views/home/item_widget_11.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryView extends StatelessWidget {
  CategoryView({Key? key}) : super(key: key);

  // final categoryController = Get.find<CategoryController>();
  // final bController = Get.find<BucketController>();
  final bController = BucketController.to;
  final categoryController = CategoryController.to;
  final bannerController = BannerController.to;
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppbarHome(
        title: appTitleEN,
        actionList: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            tooltip: 'Share',
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: Icon(Icons.favorite_border_outlined),
            tooltip: 'Wishlist',
            onPressed: () {
              Get.to(() => FavouriteView());
            },
          ), //IconB
          IconButton(
            icon: bController.bucketList.length == 0
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
            tooltip: 'view_cart_item'.tr,
            onPressed: () {
              Get.to(() => BucketView());
            },
          ),
        ],
      ),
      body: Obx(
        () => categoryController.isLoading.isTrue
            ? Center(
                child: LoadingWidget(),
              )
            : SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(),
                  child: Column(children: [
                    SizedBox(height: 10),
                    ListView.separated(
                      separatorBuilder: (context, index) =>
                          Divider(indent: 55, endIndent: 20),
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: bannerController
                          .bannerPositionList[8].bannerlist!.length,
                      itemBuilder: (context, index) {
                        final BannerModel item = bannerController
                            .bannerPositionList[8].bannerlist![index];
                        return ItemWidget11(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            screenWidth: _screenSize.width - 20,
                            item: item);
                      },
                    ),
                    Divider(),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: CBannerHomeWidget(
                        bannerHeight: 110.0,
                        fitImage: BoxFit.fill,
                        bannerList: bannerController.sliderList,
                      ),
                    ),
                    Divider(),
                    Align(
                        alignment: Alignment.topLeft,
                        child: 'CATEGORIES'.text.make().p12()),
                    ListView.separated(
                      separatorBuilder: (context, index) =>
                          Divider(indent: 55, endIndent: 20),
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: categoryController.categoryList.length,
                      itemBuilder: (context, index) {
                        final CategoryModel item =
                            categoryController.categoryList[index];
                        return InkWell(
                          onTap: () {
                            Get.toNamed(childCategoryRoute,
                                arguments: {'arg_category_item': item});
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withAlpha(70),
                                        offset: const Offset(2.0, 2.0),
                                        blurRadius: 2.0)
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.0)),
                                  image: DecorationImage(
                                    image: Image.network(
                                            '${ApiConstants.baseImageUrl}${item.image}')
                                        .image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: item.category.text.size(20).make(),
                              ),
                              Container(
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ]),
                ),
              ),
      ),
    );
  }
}

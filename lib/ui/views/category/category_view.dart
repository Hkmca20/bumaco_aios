import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/checkout/bucket_view.dart';
import 'package:bumaco_aios/ui/views/home/banners/cbanner_home.dart';
import 'package:bumaco_aios/ui/views/home/empty_failure_no_internet_view.dart';
import 'package:bumaco_aios/ui/views/home/favourite_view.dart';
import 'package:bumaco_aios/ui/views/home/item_widget_11.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryView extends StatelessWidget {
  CategoryView({Key? key}) : super(key: key);

  final pController = ProductController.to;
  final bController = BucketController.to;
  final cController = CategoryController.to;
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
          ),
          IconButton(
            icon: Obx(() => pController.productListFavourite.length == 0
                ? Icon(Icons.favorite_border_outlined)
                : Icon(Icons.favorite_border_outlined).p4().badge(
                    count: pController.productListFavourite.length,
                    color: kPrimaryColor,
                    size: 12)),
            tooltip: 'wishlist'.tr,
            onPressed: () {
              Get.to(() => FavouriteView());
            },
          ),
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
          IconButton(
            icon: Lottie.asset(offersLottie, fit: BoxFit.fill),
            tooltip: 'Offers',
            onPressed: () {
              Get.toNamed(offerRoute);
            },
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
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
                itemCount:
                    bannerController.bannerPositionList[8].bannerlist!.length,
                itemBuilder: (context, index) {
                  final BannerModel item =
                      bannerController.bannerPositionList[8].bannerlist![index];
                  return ItemWidget11(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      screenWidth: _screenSize.width - 20,
                      item: item);
                },
              ),
              Divider(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: CBannerHomeWidget(
                  bannerHeight: 110.0,
                  fitImage: BoxFit.fill,
                  bannerList: bannerController.sliderList,
                ),
              ),
              Divider(),
              SectionTile(title: 'CATEGORIES'),
              // Align(
              //     alignment: Alignment.topLeft,
              //     child: 'CATEGORIES'.text.bold.xl.make().p12()),
              cController.isLoading.isTrue
                  ? Center(child: LoadingWidget())
                  : cController.categoryList.length == 0
                      ? SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: EmptyFailureNoInternetView(
                            image: noInternetLottie,
                            title: 'Network Error',
                            description: 'Internet not working !!',
                            buttonText: "Retry",
                            onPressed: () {
                              cController.fetchCategory();
                            },
                          ),
                        )
                      : ListView.separated(
                          separatorBuilder: (context, index) => VxDivider(
                            color: commonGreyColor,
                            indent: 20,
                            endIndent: 25,
                          ),
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: cController.categoryList.length,
                          itemBuilder: (context, index) {
                            final CategoryData item =
                                cController.categoryList[index];
                            return InkWell(
                              onTap: () {
                                Get.toNamed(subCategoryRoute,
                                    arguments: {'arg_category_item': item});
                              },
                              child: Row(
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
                                  //           color: Colors.black.withAlpha(70),
                                  //           offset: const Offset(2.0, 2.0),
                                  //           blurRadius: 2.0)
                                  //     ],
                                  //     borderRadius:
                                  //         BorderRadius.all(Radius.circular(2.0)),
                                  //     image: DecorationImage(
                                  //       image: Image.network(
                                  //               '${ApiConstants.baseImageUrl}${item.image}')
                                  //           .image,
                                  //       fit: BoxFit.cover,
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(width: 2.0),
                                  Expanded(
                                    child: item.category.text.xl.make(),
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: kGreyLightColor,
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 20, vertical: 15),
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

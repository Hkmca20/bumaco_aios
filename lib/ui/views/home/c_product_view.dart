import 'dart:ui';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'product_view.dart';

class CProductView extends StatelessWidget {
  const CProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.to;
    late final CategoryModel categoryItem;
    if (Get.arguments != null) {
      categoryItem = Get.arguments['arg_category_item'];
      productController.setCategoryId(categoryItem.id);
    } else
      categoryItem = CategoryModel(category: 'Products');
    return Scaffold(
      appBar: AppbarHome(title: categoryItem.category),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 6, left: 8, right: 8),
                  child: Image(
                    image: NetworkImage(ApiConstants.baseImageUrl +
                        categoryItem.bannerimage.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 14, left: 8, right: 8),
                child: categoryItem.category.text
                    .size(14)
                    .fontWeight(FontWeight.w600)
                    .color(kPrimaryColor)
                    .make(),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                height: 200,
                child: Obx(
                  () => productController.isLoading.isTrue
                      ? LoadingWidget()
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final item = productController.productList[index];
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
                          itemCount: productController.productList.length,
                        ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: 'Featured Products'
                        .text
                        .color(kDarkGreyColor)
                        .fontWeight(FontWeight.w700)
                        .make(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => ProductView(),
                              arguments: {'arg_category_item': categoryItem});
                        },
                        child: 'View All'.text.make()),
                  ),
                ],
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 6, left: 8, right: 8),
                  child: Image(
                    image: NetworkImage(
                        ApiConstants.baseImageUrl + categoryItem.bannerimage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                child: Obx(
                  () => productController.isLoading.isTrue
                      ? LoadingWidget()
                      : GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                          children: List.generate(
                              productController.productList.length, (index) {
                            ProductModel item =
                                productController.productList[index];
                            return Container(
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                    onTap: () {
                                      print('card onClick event');
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                            child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      ApiConstants
                                                              .baseImageUrl +
                                                          item.fimage),
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
              ),
              categoryItem.image == null
                  ? Container()
                  : Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 6, left: 8, right: 8),
                        child: Image(
                          image: NetworkImage(
                              '${ApiConstants.baseImageUrl}${categoryItem.image}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              Container(
                child: Obx(
                  () => productController.isLoading.isTrue
                      ? LoadingWidget()
                      : GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                          children: List.generate(
                              productController.productList.length, (index) {
                            ProductModel item =
                                productController.productList[index];
                            return Container(
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                    onTap: () {
                                      print('card onClick event');
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                            child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      ApiConstants
                                                              .baseImageUrl +
                                                          item.fimage),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

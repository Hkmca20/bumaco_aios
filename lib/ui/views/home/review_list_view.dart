import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/rating/rating_view.dart';
import 'package:bumaco_aios/ui/shopping/review_item.dart';
import 'package:bumaco_aios/ui/views/checkout/bucket_view.dart';
import 'package:bumaco_aios/ui/widgets/cproduct_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'empty_widget.dart';

class ReviewListView extends StatelessWidget {
  ReviewListView({Key? key}) : super(key: key);

  final productController = ProductController.to;
  final pdController = ProductDetailController.to;
  var selectedChoice = 0;
  final choiceList = [
    'Verified Buyers',
    'with Images',
    '5 Star',
    '4 Star',
    '3 Star',
    '2 Star',
    '1 Star'
  ];
  @override
  Widget build(BuildContext context) {
    productController.getFavouriteList();
    return Scaffold(
      appBar: AppbarHome(
        title: 'Reviews',
        actionList: [
          IconButton(
            icon: Icon(Icons.reviews_outlined),
            tooltip: 'write a review',
            onPressed: () {
              Get.toNamed(ratingRoute,
                  arguments: {'arg_product_item': pdController.productItem});
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              child: ListView.builder(
                  padding: EdgeInsets.all(2),
                  scrollDirection: Axis.horizontal,
                  itemCount: choiceList.length,
                  itemBuilder: (context, index) {
                    final item = choiceList[index];
                    return ChoiceChip(
                      label: item.text.center.make(),
                      selected: selectedChoice == index,
                      selectedColor: Colors.green,
                      onSelected: (bool selected) {
                        selectedChoice = selected ? index : 0;
                      },
                      backgroundColor: kGreyLightColor,
                      labelStyle: TextStyle(color: Colors.white),
                    ).paddingAll(5);
                  }),
            ),
            Expanded(
              child: Obx(
                () => productController.allProductList.length == 0
                    ? EmptyContentWidget()
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: productController.allProductList.length,
                        padding: EdgeInsets.all(4),
                        itemBuilder: (context, index) {
                          // ProductModel item =
                          //     productController.allProductList[index];
                          return Card(elevation: 6, child: ReviewItem());
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

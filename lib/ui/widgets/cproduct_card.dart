import 'dart:ui';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/bucket_controller.dart';
import 'package:bumaco_aios/ui/controller/product_controller.dart';
import 'package:bumaco_aios/ui/rating/rating_view.dart';
import 'package:bumaco_aios/ui/shopping/cproduct_detail_view.dart';
import 'package:bumaco_aios/ui/shopping/product_detail_view.dart';
import 'package:bumaco_aios/ui/shopping/product_detail_view1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:transparent_image/transparent_image.dart';

import 'star_rating.dart';

class CProductTile extends StatelessWidget {
  const CProductTile({
    Key? key,
    required this.prod,
    this.index = 0,
    this.offset = 0.0,
    required this.bController,
    required this.pController,
  }) : super(key: key);

  final ProductController pController;
  final BucketController bController;
  final ProductModel prod;
  final double offset;
  final int index;

  @override
  Widget build(BuildContext context) {
    // final itemPositionOffset = index * itemSize;
    // final diff = offset - itemPositionOffset;
    // final percent = 1 - (diff / (itemSize));
    // final value = percent.clamp(0.0, 1.0);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Get.to(() => CProductDetailView(),
                arguments: {'arg_product_item': prod});
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: ApiConstants.baseImageUrl + prod.fimage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Obx(() => CircleAvatar(
                          backgroundColor: Colors.white54,
                          child: IconButton(
                            icon: prod.isFavorite.isTrue
                                ? Icon(Icons.favorite_rounded)
                                : Icon(Icons.favorite_border),
                            onPressed: () {
                              prod.isFavorite.isTrue
                                  ? pController.removeFavourite(prod)
                                  : pController.insertFavourite(prod);
                              prod.isFavorite.toggle();
                            },
                          ),
                        )),
                  )
                ],
              ),
              SizedBox(height: 8),
              prod.product.text.capitalize.ellipsis
                  .maxLines(2)
                  .fontWeight(FontWeight.w800)
                  .size(18)
                  .make()
                  .p2(),
              '${prod.shortDescription} : ${prod.description}'
                  .text
                  .capitalize
                  .ellipsis
                  .maxLines(3)
                  .color(kGreyLightColor)
                  .size(12)
                  .make(),
              SizedBox(height: 8),
              Row(children: [
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: prod.mrp == '' ? '' : '\$${prod.mrp}',
                      style: TextStyle(
                        fontSize: 16,
                        color: kGreyLightColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    TextSpan(
                      text: '  \$${prod.mrp}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ]),
                ),
                Expanded(child: SizedBox(width: 5)),
                '20% Off'.text.bold.color(kPrimaryColor).make()
              ]),
              SizedBox(height: 4),
              // if (prod.rating != null)
              HStack([
                StarRating(
                  iconsize: 12,
                  rating: 4.5,
                  onRatingChanged: (rating) => rating = rating,
                ),
                ' (17)'.text.make(),
              ]),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.green,
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              //   padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       Text(
              //         // prod.rating.toString(),
              //         5.toString(),
              //         style: TextStyle(color: Colors.white),
              //       ),
              //       SizedBox(width: 4),
              //       // Transform.rotate(
              //       //   angle: pi * value,
              //       // child:
              //       Icon(
              //         Icons.star,
              //         size: 16,
              //         color: Colors.white,
              //       ),
              //       // ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 8),
              Divider(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    bController.insertBucket(prod);
                  },
                  child: Text('add_to_cart'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: kWhiteColor)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

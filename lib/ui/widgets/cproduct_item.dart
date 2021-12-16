import 'dart:ui';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/shopping/cproduct_detail_view.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'star_rating.dart';

class CProductItem extends StatelessWidget {
  CProductItem({
    Key? key,
    required this.prod,
    this.index = 0,
    this.offset = 0.0,
  }) : super(key: key);

  final lController = LocaleController.to;
  final pController = ProductController.to;
  final bController = BucketController.to;
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
        padding: const EdgeInsets.all(0.0),
        child: InkWell(
          onTap: () {
            pController.openProductDetail(prod);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(1)),
                      child: CachedNetworkImage(
                        imageUrl: ApiConstants.baseImageUrl + prod.fimage,
                        // progressIndicatorBuilder:
                        //     (context, url, downloadProgress) =>
                        //         CircularProgressIndicator(
                        //             value: downloadProgress.progress),
                        // imageBuilder: (context, imageProvider) => Container(
                        //   decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: imageProvider,
                        //         fit: BoxFit.cover,
                        //         colorFilter: ColorFilter.mode(
                        //             Colors.red, BlendMode.colorBurn)),
                        //   ),
                        // ),
                        placeholder: (context, url) => AppLogoWidget(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      // FadeInImage.memoryNetwork(
                      //   placeholder: kTransparentImage,
                      //   image: ApiConstants.baseImageUrl + prod.fimage,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(1)),
                    ),
                  ),
                  // Positioned(
                  //   right: 0,
                  //   child: Obx(() => CircleAvatar(
                  //         backgroundColor: Colors.white54,
                  //         child: IconButton(
                  //           icon: prod.isFavorite.isTrue
                  //               ? Icon(Icons.favorite_rounded)
                  //               : Icon(Icons.favorite_border),
                  //           onPressed: () {
                  //             prod.isFavorite.isTrue
                  //                 ? pController.removeFavourite(prod)
                  //                 : pController.insertFavourite(prod);
                  //             prod.isFavorite.toggle();
                  //           },
                  //         ),
                  //       )),
                  // ),
                ],
              ),
              SizedBox(height: 4),
              // prod.product.text.capitalize.ellipsis
              //     .maxLines(2)
              //     .fontWeight(FontWeight.w800)
              //     .size(14)
              //     .make()
              //     .p2(),
              // '${prod.shortDescription} : ${prod.description}'
              //     .text
              //     .capitalize
              //     .ellipsis
              //     .maxLines(2)
              //     .color(kGreyLightColor)
              //     .size(12)
              //     .make()
              //     .p12(),
              prod.product
                  .trim()
                  .text
                  .capitalize
                  .ellipsis
                  .bold
                  .xl
                  .maxLines(2)
                  .color(kGreyLightColor)
                  .make()
                  .p12()
                  .centered()
                  .h8(context),
              '2pcs'
                  .text
                  .capitalize
                  .sm
                  .ellipsis
                  .maxLines(2)
                  .color(kGreyLightColor)
                  .make()
                  .p2(),
              SizedBox(height: 4),
              Stack(
                children: [
                  Positioned(
                      top: 2,
                      left: 2,
                      child: Icon(
                        Icons.crop_square,
                        size: 12,
                        color: kGreyLightColor,
                      )),
                  Positioned(
                      child: Icon(
                    Icons.image,
                    size: 12,
                    color: kPrimaryColor,
                  )),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      child: '55 Shades'.text.sm.coolGray300.make())
                ],
              ),
              SizedBox(height: 4),
              HStack([
                (prod.mrp == ''
                        ? ''
                        : '${lController.selectedSymbol}${prod.mrp}')
                    .richText
                    .sm
                    .lineThrough
                    .color(kGreyLightColor)
                    .make(),
                '  ${lController.selectedSymbol}${prod.mrp}'
                    .richText
                    .base
                    .make()
                // Container(
                //     height: 15, child: VerticalDivider(color: kDarkGreyColor)),
                // '20% Off'.text.bold.color(kPrimaryColor).make()
              ]).p8(),
              '20% Off'.text.bold.xl.color(kPrimaryColor).make(),
              SizedBox(height: 4),
              // if (prod.rating != null)
              HStack([
                StarRating(
                  iconsize: 12,
                  rating: 4.5,
                  onRatingChanged: (rating) => rating = rating,
                ),
                ' (17)'.text.sm.color(kGreyLightColor).make(),
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
              SizedBox(height: 20),
              VxDivider(),
              HStack([
                Obx(
                  () => IconButton(
                    icon: prod.isFavorite.isTrue
                        ? Icon(
                            Icons.favorite_rounded,
                            color: kPrimaryColor,
                          )
                        : Icon(Icons.favorite_border),
                    onPressed: () {
                      prod.isFavorite.isTrue
                          ? pController.removeFavourite(prod)
                          : pController.insertFavourite(prod);
                      prod.isFavorite.toggle();
                    },
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      bController.insertBucket(prod);
                    },
                    child: 'add_to_cart'.tr.text.base.make(),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

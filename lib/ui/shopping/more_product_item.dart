import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/shopping/cproduct_detail_view.dart';
import 'package:bumaco_aios/ui/widgets/star_rating.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CMoreProductItem extends StatelessWidget {
  CMoreProductItem({
    Key? key,
    required this.item,
    required Size screenSize,
    required this.lController,
  })  : _screenSize = screenSize,
        super(key: key);

  final ProductModel item;
  final Size _screenSize;
  final LocaleController lController;
  final bController = BucketController.to;
  final pController = ProductController.to;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: () {
            Get.to(() => CProductDetailView(),
                arguments: {'arg_product_item': item});
          },
          child: VStack(
            [
              5.heightBox,
              Container(
                width: 80,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(1)),
                  child: CachedNetworkImage(
                    imageUrl: ApiConstants.baseImageUrl + item.fimage,
                    placeholder: (context, url) => AppLogoWidget(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                decoration: BoxDecoration(
                  color: kTransparentColor,
                  // border: Border.all(color: kGreyLightColor),
                  borderRadius: BorderRadius.all(Radius.circular(1)),
                ),
              ),
              item.product.text.ellipsis.xs.semiBold.center
                  .maxLines(2)
                  .make()
                  .p4()
                  .box
                  .height(30)
                  .width(_screenSize.width / 3 + 20)
                  .make()
                  .p2(),
              '15ml'.text.xs.make().p2(),
              HStack([
                // Icon(Icons.star, size: 12),

                StarRating(
                  iconsize: 12,
                  rating: 4.5,
                  onRatingChanged: (rating) => rating = rating,
                ),
                ' (117)'.text.xs.make()
              ]),
              '20% Off'.text.lg.bold.color(kPrimaryColor).make().p2(),
              HStack([
                (item.mrp == ''
                        ? ''
                        : '${lController.selectedSymbol}${item.mrp}')
                    .richText
                    .sm
                    .color(kGreyLightColor)
                    .lineThrough
                    .make(),
                ' ${lController.selectedSymbol}${item.mrp}'
                    .selectableText
                    .sm
                    .make(),
              ]).p4(),
              HStack(
                [
                  Obx(
                    () => IconButton(
                      icon: item.isFavorite.isTrue
                          ? Icon(
                              Icons.favorite_rounded,
                              color: kPrimaryColor,
                            )
                          : Icon(Icons.favorite_border),
                      onPressed: () {
                        item.isFavorite.isTrue
                            ? pController.removeFavourite(item)
                            : pController.insertFavourite(item);
                        item.isFavorite.toggle();
                      },
                    ).p2(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bController.insertBucket(item);
                    },
                    child: 'add_to_cart'.tr.text.base.make(),
                  ),
                ],
              )
            ],
            crossAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

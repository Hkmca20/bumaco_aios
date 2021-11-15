import 'dart:ui';

import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/widgets/app_logo_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemBucket extends StatelessWidget {
  const ItemBucket({Key? key, required this.item, required this.bController})
      : super(key: key);

  final BucketEntity item;
  final BucketController bController;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: HStack(
        [
          Expanded(
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: ApiConstants.baseImageUrl + item.fimage,
                filterQuality: FilterQuality.high,
                placeholderFadeInDuration: 1.seconds,
                fit: BoxFit.cover,
                placeholder: (context, url) => AppLogoWidget(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // FadeInImage.memoryNetwork(
              //   placeholder: kTransparentImage,
              //   image: ApiConstants.baseImageUrl + item.fimage,
              //   fit: BoxFit.cover,
              // ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            flex: 2,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 8),
              child: VStack(
                [
                  item.product.text
                      .size(16)
                      .capitalize
                      .fontWeight(FontWeight.w900)
                      .ellipsis
                      .maxLines(2)
                      .make()
                      .px2(),
                  item.brand.text.capitalize.make().px2(),
                  SizedBox(height: 1),
                  ('${item.shortDescription} : ${item.description}')
                      .text
                      .capitalize
                      .ellipsis
                      .maxLines(3)
                      .make()
                      .px2(),
                ],
                alignment: MainAxisAlignment.center,
                crossAlignment: CrossAxisAlignment.start,
              ),
            ),
            flex: 6,
          ),
          VStack(
            [
              ('\$${item.mrp}x${item.quantity.toString()} = ${item.totalPrice}')
                  .text
                  .size(16)
                  .make()
                  .px2(),
              VxDivider(),
              HStack(
                [
                  IconButton(
                    onPressed: () {
                      bController.increDecreQuantity(item, false);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: kPrimaryColor,
                    ),
                  ),
                  item.quantity.text
                      .fontWeight(FontWeight.bold)
                      .size(22)
                      .capitalize
                      .make()
                      .p4(),
                  IconButton(
                    onPressed: () {
                      bController.increDecreQuantity(item, true);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
                alignment: MainAxisAlignment.end,
              ),
            ],
            crossAlignment: CrossAxisAlignment.center,
          ),
        ],
        crossAlignment: CrossAxisAlignment.center,
        alignment: MainAxisAlignment.center,
      ),
    ).padding(const EdgeInsets.all(8)).make();
  }
}

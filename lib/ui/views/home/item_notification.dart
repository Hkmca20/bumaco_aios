import 'dart:ui';
import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class ItemNotification extends StatelessWidget {
  const ItemNotification({Key? key, required this.item}) : super(key: key);

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: HStack(
        [
          Expanded(
            child: ClipRRect(
              child: Image(
                image: NetworkImage(
                    ApiConstants.baseImageUrl + item.shortDescription),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 8),
              child: VStack(
                [
                  item.product.text
                      .size(16)
                      .fontWeight(FontWeight.w900)
                      .ellipsis
                      .maxLines(2)
                      .make()
                      .p8(),
                  item.brand.text.make().p8()
                ],
                alignment: MainAxisAlignment.center,
                crossAlignment: CrossAxisAlignment.start,
              ),
            ),
            flex: 6,
          ),
        ],
        crossAlignment: CrossAxisAlignment.center,
        alignment: MainAxisAlignment.center,
      ),
    ).padding(const EdgeInsets.all(8)).make();
  }
}

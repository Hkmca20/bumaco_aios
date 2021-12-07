import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemWidget1 extends StatelessWidget {
  const ItemWidget1({
    Key? key,
    required EdgeInsets padding,
    required double screenWidth,
    required this.item,
  })  : _padding = padding,
        _screenWidth = screenWidth,
        super(key: key);

  final EdgeInsets _padding;
  final double _screenWidth;
  final CategoryData item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: InkWell(
        onTap: () {
          Get.toNamed(childCategoryRoute,
              arguments: {'arg_category_id': item.id});
        },
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              width: _screenWidth / 2,
              height: 100,
              child: Card(
                clipBehavior: Clip.hardEdge,
                elevation: 4,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(childCategoryRoute,
                        arguments: {'arg_category_item': item});
                  },
                  child: Image(
                      fit: BoxFit.fill,
                      image: Image.network(
                              '${ApiConstants.baseImageUrl}${item.bannerimage}')
                          .image
                      // '${item.bannerimage}').image,
                      ),
                ),
              ),
            ),
            Container(
              width: _screenWidth / 2,
              margin: EdgeInsets.only(top: 4),
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(item.category ,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyText1!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemWidget11 extends StatelessWidget {
  const ItemWidget11({
    Key? key,
    required EdgeInsets padding,
    required double screenWidth,
    required this.item,
  })  : _padding = padding,
        _screenWidth = screenWidth,
        super(key: key);

  final EdgeInsets _padding;
  final double _screenWidth;
  final BannerModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: InkWell(
        onTap: () {
          Get.toNamed(productRoute, arguments: {
            'arg_category_item': CategoryModel(category: item.bannerposition)
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          width: _screenWidth,
          child: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 4,
            child: Image(
                fit: BoxFit.cover,
                image:
                    Image.network('${ApiConstants.baseImageUrl}${item.image}')
                        .image),
          ),
        ),
      ),
    );
  }
}

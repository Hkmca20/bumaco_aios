import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          Get.toNamed(cProductRoute, arguments: {
            'arg_category_item':
                CategoryData(category: item.bannerposition, id: item.id)
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          width: _screenWidth,
          child: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 4,
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.baseImageUrl}${item.image}',
                filterQuality: FilterQuality.low,
                placeholderFadeInDuration: 500.milliseconds,
                fit: BoxFit.cover,
                placeholder: (context, url) => LoadingWidget(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemWidget22 extends StatelessWidget {
  const ItemWidget22({
    Key? key,
    required EdgeInsets padding,
    required this.item,
    required double screenWidth,
  })  : _padding = padding,
        _screenWidth = screenWidth,
        super(key: key);

  final EdgeInsets _padding;
  final BannerModel item;
  final double _screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: InkWell(
        onTap: () {
          Get.toNamed(childCategoryRoute,
              arguments: {'arg_category_item': item});
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: kGreyLightColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha(40),
                  offset: const Offset(3.0, 10.0),
                  blurRadius: 15.0)
            ],
            image: DecorationImage(
              image: Image.network('${ApiConstants.baseImageUrl}${item.image}').image,
              // image: Image.network('${item.image}').image,
              fit: BoxFit.fill,
            ),
          ),
          width: _screenWidth / 2,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    decoration: new BoxDecoration(
                        color: const Color(0xFF273A48),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: new Radius.circular(10.0))),
                    height: 30.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${item.category}',
                          style: new TextStyle(color: Colors.white),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

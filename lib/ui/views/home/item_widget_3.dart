import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemWidget3 extends StatelessWidget {
  const ItemWidget3({
    Key? key,
    required EdgeInsets padding,
    required double screenWidth,
    required this.item,
  })  : _padding = padding,
        _screenWidth = screenWidth,
        super(key: key);

  final EdgeInsets _padding;
  final double _screenWidth;
  final CategoryModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(childCategoryRoute, arguments: {'arg_category_item': item});
      },
      child: Container(
        padding: _padding,
        height: _screenWidth / 3,
        width: _screenWidth / 3,
        margin: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(20, 0, 0, 0),
                blurRadius: 2.0,
                offset: Offset(2.0, 2.0))
          ],
          border: Border.all(
              width: 1.0,
              style: BorderStyle.none,
              color: Color.fromARGB(255, 0, 0, 0)),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('${ApiConstants.baseImageUrl}${item.image}')),
          // image: NetworkImage('${item.image}')),
        ),
        child: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Center(
                      child: Text(
                    item.category,
                    style: TextStyle(color: kWhiteColor),
                  ))))
        ]),
      ),
    );
  }
}

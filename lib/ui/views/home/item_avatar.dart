import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleAvatar extends StatelessWidget {
  const SampleAvatar({
    Key? key,
    required EdgeInsets padding,
    required this.item,
  })  : _padding = padding,
        super(key: key);

  final EdgeInsets _padding;
  final CategoryModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(allProductsRoute,
                  arguments: {'arg_category_id': item.id});
            },
            child: Container(
              width: 110.0,
              height: 110.0,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              child: CircleAvatar(
                backgroundColor: kTransparentColor,
                backgroundImage:
                    NetworkImage('${ApiConstants.baseImageUrl}${item.image}'),
                // NetworkImage('${item.image}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

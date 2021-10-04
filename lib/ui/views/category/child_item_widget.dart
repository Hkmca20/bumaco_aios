import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChildItemWidget extends StatelessWidget {
  const ChildItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ChildCategoryModel item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          Container(
            height: 72,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(subCategoryRoute,
                        arguments: {'arg_category_id': item.childcategory});
                  },
                  child: Container(
                    height: 72.0,
                    width: 72.0,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(70),
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 2.0)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      image: DecorationImage(
                        image: Image.network(
                                '${ApiConstants.baseImageUrl}${item.image}')
                            .image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.category ?? '',
                        style: Theme.of(context).textTheme.headline5),
                    Text(item.childcategory ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.black54))
                  ],
                )),
                Container(
                  height: 72,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: const Color(0xFF273A48),
                  ),
                )
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

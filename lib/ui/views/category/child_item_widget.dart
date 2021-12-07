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
      title: Container(
        height: 110,
        child: InkWell(
          onTap: () {
            Get.toNamed(productRoute, arguments: {
              'arg_category_item':
                  CategoryData(id: item.id, category: item.category!)
            });
            //   Get.toNamed(subCategoryRoute,
            //       arguments: {'arg_child_category_item': item});
          },
          child: Card(
            margin: EdgeInsets.all(2),
            shadowColor: Colors.grey,
            elevation: 1,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(70),
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 2.0)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                      image: DecorationImage(
                        image: Image.network(
                                '${ApiConstants.baseImageUrl}${item.image}')
                            .image,
                        fit: BoxFit.cover,
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
                          style: Theme.of(context).textTheme.headline6),
                      Text(item.childcategory ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: kGreyLightColor))
                    ],
                  )),
                  Container(
                    height: 80,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

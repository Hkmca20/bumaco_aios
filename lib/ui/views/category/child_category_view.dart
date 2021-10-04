import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar_main.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'child_item_widget.dart';

class ChildCategoryView extends StatelessWidget {
  const ChildCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final childCategoryController = Get.find<ChildCategoryController>();
    final categoryId = Get.arguments['arg_category_id'];
    childCategoryController.setCategoryId(categoryId);
    print(categoryId);
    return Scaffold(
        appBar: AppbarHome(
          title: 'Bumaco',
          actionList: [
            IconButton(
              icon: Icon(Icons.favorite_rounded),
              color: kPrimaryColorDark,
              tooltip: 'Wishlist',
              onPressed: () {},
            ), //IconB
            IconButton(
              icon: Icon(Icons.share_rounded),
              color: kPrimaryColorDark,
              tooltip: 'Share',
              onPressed: () {},
            ), //IconButton
            IconButton(
              icon: Icon(Icons.shopping_cart_rounded),
              color: kPrimaryColorDark,
              tooltip: 'View Cart Item',
              onPressed: () {
                childCategoryController.fetchChildCategory(categoryId);
              },
            ),
          ],
        ),
        body: Obx(
          () => childCategoryController.isLoading.isTrue
              ? LoadingWidget()
              : ListView.separated(
                  itemBuilder: (context, index) {
                    ChildCategoryModel item =
                        childCategoryController.childCategoryList[index];
                    return ChildItemWidget(item: item);

                    // Column(children: [
                    //   GestureDetector(
                    //       onTap: () {
                    //         Get.toNamed(subCategoryRoute, arguments: {
                    //           'arg_child_category_id': item.category
                    //         });
                    //       },
                    //       child: Image.network(
                    //           ('${ApiConstants.baseImageUrl}${item.image}'))),
                    //   SizedBox(height: 10),
                    //   Text(item.category ?? '', style: TextStyle(fontSize: 20)),
                    //   Text(item.childcategory ?? '',
                    //       style: TextStyle(fontSize: 20)),
                    //   Text(item.subcategory ?? '', style: TextStyle(fontSize: 20)),
                    //   SizedBox(height: 10),
                    // ]);
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: childCategoryController.childCategoryList.length),
        ));
    //   ),
    // );
  }
}

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/sliver_appbar.dart';
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
    // final childCategoryController = Get.find<ChildCategoryController>();
    final childCategoryController = ChildCategoryController.to;
    final categoryId;
    late final CategoryData categoryItem;
    if (Get.arguments != null) {
      categoryItem = Get.arguments['arg_category_item'];
      categoryId = categoryItem.id;
      childCategoryController.setCategoryId(categoryId);
    }
    return Scaffold(
        body: CustomScrollView(
          
//           CustomScrollView(slivers: [
//   SliverAppBar(...),
//   SliverPadding(...),
//   SliverList(...),
//   SliverGrid(...),
// ],
      slivers: [
        FlexibleAppBar(
          titleStr: categoryItem.category,
          imageUrl: '${categoryItem.bannerimage}',
          actionList: [
            IconButton(
              icon: Icon(Icons.refresh_rounded),
              tooltip: 'Reload',
              onPressed: () {
                childCategoryController.fetchChildCategory(categoryItem.id);
              },
            ),
          ],
        ),
        Obx(
          () => SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, index) => ChildItemWidget(
                  item: childCategoryController.childCategoryList[index]),
              childCount: childCategoryController.childCategoryList.length,
            ),
            // delegate: SliverChildListDelegate(List.generate(
            //   childCategoryController.childCategoryList.length,
            //   (index) => ChildItemWidget(
            //       item: childCategoryController.childCategoryList[index]),
            // )),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0, //screenSize.width
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
          ),
        ),
        // Obx(
        //   () => SliverList(
        //       delegate: SliverChildListDelegate(List.generate(
        //     childCategoryController.childCategoryList.length,
        //     (index) => ChildItemWidget(
        //         item: childCategoryController.childCategoryList[index]),
        //   ))),
        // ),
        // SliverFillRemaining(
        //   child: Obx(
        //     () => childCategoryController.isLoading.isTrue
        //         ? LoadingWidget()
        //         : ListView.separated(
        //             itemBuilder: (context, index) {
        //               return ChildItemWidget(
        //                   item: childCategoryController
        //                       .childCategoryList[index]);
        //             },
        //             separatorBuilder: (context, index) => Divider(),
        //             itemCount:
        //                 childCategoryController.childCategoryList.length),
        //   ),
        // ),
      ],
    ));
  }
}

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar_main.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryView extends StatelessWidget {
  const SubCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subCategoryController = Get.find<SubCategoryController>();
    final args = Get.arguments;
    final ChildCategoryModel childCategoryItem = args['arg_child_category_item'] ?? '';
    subCategoryController.setChildCategoryId(childCategoryItem.category);
    return Scaffold(
      appBar: AppbarHome(
        title: 'Sub Category',
        actionList: [
          IconButton(
            icon: Icon(Icons.refresh_rounded),
            tooltip: 'Reload Sub Category',
            onPressed: () {
              subCategoryController.fetchSubCategory();
            },
          ),
        ],
      ),
      body: Obx(() => subCategoryController.isLoading.isTrue
          ? Center(
              child: LoadingWidget(),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                SubCategoryModel item =
                    subCategoryController.subCategoryList[index];
                return Column(children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(allProductsRoute, arguments: {
                          'arg_sub_category_item': item
                        });
                      },
                      child: Image.network(
                          ('${ApiConstants.baseImageUrl}${item.bannerimage}'))),
                  SizedBox(height: 10),
                  Image.network(('${ApiConstants.baseImageUrl}${item.image}')),
                  Text(item.category ?? '', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                ]);
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: subCategoryController.subCategoryList.length)),
    );
  }
}

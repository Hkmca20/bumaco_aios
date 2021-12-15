import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SubCategoryView extends StatelessWidget {
  const SubCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subCategoryController = SubCategoryController.to;
    return Scaffold(
      appBar: AppbarHome(
        title: 'Sub Category',
        actionList: [
          IconButton(
            icon: Icon(Icons.refresh_rounded),
            tooltip: 'Reload Sub Category',
            onPressed: () {
              subCategoryController
                  .fetchSubCategory(subCategoryController.categoryData.id);
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
                return InkWell(
                  onTap: () {
                    print('pass check------------->${item.id}');
                    Get.toNamed(childCategoryRoute,
                        arguments: {'arg_subcategory_item': item});
                    // Get.toNamed(allProductsRoute, arguments: {
                    //   'arg_sub_category_item': item
                    // });
                  },
                  child: HStack(
                    [
                      // SizedBox(width: 2),
                      // Image.network(
                      //     ('${ApiConstants.baseImageUrl}${item.image}')),
                      // SizedBox(width: 2.0),
                      Expanded(
                        child: (item.subcategory ?? '').text.size(18).make(),
                      ),
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: kGreyLightColor,
                        ),
                      ),
                    ],
                    crossAlignment: CrossAxisAlignment.center,
                  ).paddingSymmetric(horizontal: 20, vertical: 15),
                );
              },
              separatorBuilder: (context, index) => VxDivider(
                    color: commonGreyColor,
                    indent: 10,
                    endIndent: 10,
                  ),
              itemCount: subCategoryController.subCategoryList.length)),
    );
  }
}

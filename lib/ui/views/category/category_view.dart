import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();
    return Scaffold(
      appBar: BumacoAppbar(
        title: 'Bumaco',
        actionList: [
          IconButton(
            icon: Icon(Icons.share_rounded),
            tooltip: 'Share',
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            tooltip: 'Reload',
            onPressed: () {
              categoryController.fetchCategory();
            },
          ),
        ],
      ),
      body: Obx(() => categoryController.isLoading.isTrue
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                CategoryModel item = categoryController.categoryList[index];
                return Column(children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(childCategoryRoute,
                            arguments: {'get_category': item.category});
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
              itemCount: categoryController.categoryList.length)),
    );
  }
}

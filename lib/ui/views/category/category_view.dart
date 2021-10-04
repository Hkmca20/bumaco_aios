import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar_main.dart';
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
                            arguments: {'arg_category_id': item.id});
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

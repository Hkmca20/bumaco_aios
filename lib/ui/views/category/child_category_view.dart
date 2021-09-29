import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChildCategoryView extends StatelessWidget {
  const ChildCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final childCategoryController = Get.find<ChildCategoryController>();
    return Scaffold(
      appBar: BumacoAppbar(
        title: 'Category',color: Colors.transparent,
        actionList: [
          IconButton(
            icon: Icon(Icons.share),
            tooltip: 'Share',
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: Icon(Icons.refresh_rounded),
            tooltip: 'Reload',
            onPressed: () {
              childCategoryController.fetchChildCategory();
            },
          ),
        ],
      ),
      body: Obx(() => childCategoryController.isLoading.isTrue
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                ChildCategoryModel item = childCategoryController.childCategoryList[index];
                return Column(children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(newsDetailRoute,
                            arguments: {'get_article': item.category});
                      },
                      child: Image.network(
                          ('${ApiConstants.baseImageUrl}${item.image}'))),
                  SizedBox(height: 10),
                  Text(item.category ?? '', style: TextStyle(fontSize: 20)),
                  Text(item.childcategory ?? '', style: TextStyle(fontSize: 20)),  
                  Text(item.subcategory ?? '', style: TextStyle(fontSize: 20)),  
                  SizedBox(height: 10),
                ]);
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: childCategoryController.childCategoryList.length)),
    );
  }
}

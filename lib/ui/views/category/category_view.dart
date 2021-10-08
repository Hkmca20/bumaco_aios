import 'package:bumaco_aios/app_core/models/models.dart';
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
        title: appTitle,
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
              child: LoadingWidget(),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                CategoryModel item = categoryController.categoryList[index];
                return Column(children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(childCategoryRoute,
                          arguments: {'arg_category_item': item});
                    },
                    child: Image.network(
                      ('${ApiConstants.baseImageUrl}${item.bannerimage}'),
                      // ('${item.bannerimage}'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 72.0,
                          width: 72.0,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withAlpha(70),
                                  offset: const Offset(2.0, 2.0),
                                  blurRadius: 2.0)
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
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
                            Text(item.category,
                                style: Theme.of(context).textTheme.headline5),
                            Text(item.category,
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
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ]);
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: categoryController.categoryList.length)),
    );
  }
}

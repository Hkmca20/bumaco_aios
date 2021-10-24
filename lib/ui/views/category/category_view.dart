import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/home/banners/a_banner.dart';
import 'package:bumaco_aios/ui/views/checkout/bucket_view.dart';
import 'package:bumaco_aios/ui/views/home/favourite_view.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final categoryController = Get.find<CategoryController>();
    final categoryController = CategoryController.to;
    return Scaffold(
      appBar: AppbarHome(
        title: appTitle,
        actionList: [
          IconButton(
            icon: Icon(Icons.favorite_rounded),
            color: kPrimaryColorDark,
            tooltip: 'Wishlist',
            onPressed: () {
              Get.to(() => FavouriteView());
            },
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
              Get.to(() => BucketView());
            },
          ),
        ],
      ),
      body: Obx(
        () => categoryController.isLoading.isTrue
            ? Center(
                child: LoadingWidget(),
              )
            : ListView.builder(
                itemCount: categoryController.categoryList.length,
                itemBuilder: (context, index) {
                  CategoryModel item = categoryController.categoryList[index];
                  return InkWell(
                    onTap: () {
                      Get.toNamed(childCategoryRoute,
                          arguments: {'arg_category_item': item});
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withAlpha(70),
                                  offset: const Offset(2.0, 2.0),
                                  blurRadius: 2.0)
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.0)),
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
                          child: item.category.text.size(20).make(),
                        ),
                        Container(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

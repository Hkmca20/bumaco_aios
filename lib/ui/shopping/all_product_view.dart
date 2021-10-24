import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/product_makeup_controller.dart';
import 'package:bumaco_aios/ui/widgets/aproduct_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final categoryController = Get.find<CategoryController>();
    final productMakeupController = Get.find<ProductMakeupController>();
    // final _choiceIndex = 0;
    return Scaffold(
      appBar: AppbarHome(
        title: 'Bumaco',
        actionList: [
          // IconButton(
          //   icon: Icon(Icons.favorite_rounded),
          //   tooltip: 'Wish List',
          //   onPressed: () {
          //     Get.toNamed(wishlistRoute);
          //   },
          // ), //IconB
          // IconButton(
          //     onPressed: () {
          //       productMakeupController.changeColumnCount(1);
          //     },
          //     tooltip: 'List Item',
          //     icon: Icon(Icons.view_list_rounded)),
          // IconButton(
          //     onPressed: () {
          //       productMakeupController.changeColumnCount(2);
          //     },
          //     tooltip: 'Grid Item',
          //     icon: Icon(Icons.grid_view_outlined)),
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined),
            tooltip: 'View Cart Item',
            onPressed: () {
              // productMakeupController.fetchProductMakeup();
            },
          ),
        ],
      ),
      body: 
      // Column(
      //   children: [
      // Wrap(
      //   spacing: 3.0, // gap between adjacent chips
      //   runSpacing: 3.0, // gap between lines
      //   direction: Axis.horizontal,
      //   children:
      //       List.generate(categoryController.categoryList.length, (index) {
      //     return Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 4.0),
      //       child: ChoiceChip(
      //         label: Text(
      //           categoryController.categoryList[index].category,
      //           style: Theme.of(context)
      //               .textTheme
      //               .bodyText1!
      //               .copyWith(color: kWhiteColor),
      //         ),
      //         padding: EdgeInsets.all(4),
      //         selected: _choiceIndex == index,
      //         selectedColor: Colors.red,
      //         onSelected: (bool selected) {
      //           productMakeupController.fetchProductMakeup();
      //           // setState(() {
      //           //   _choiceIndex = selected ? index : 0;
      //           // });
      //         },
      //         backgroundColor: Colors.grey,
      //       ),
      //     );
      //   }),
      // ),
      // Expanded(
        // child: 
        Obx(
          () => productMakeupController.isLoading.isTrue
              ? LoadingWidget()
              : StaggeredGridView.countBuilder(
                  controller: productMakeupController.scrollController,
                  crossAxisCount: productMakeupController.columnCount.value,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 12,
                  itemCount: productMakeupController.productMakeupList.length,
                  itemBuilder: (context, index) {
                    return AProductTile(
                        prod: productMakeupController.productMakeupList[index],
                        index: index,
                        itemSize: productMakeupController.productMakeupList.length,
                        offset: productMakeupController.offset.value,);
                  },
                  staggeredTileBuilder: (int index) {
                    return StaggeredTile.fit(1);
                  },
                ),
        ),
      // ),
        // ],
      // ),
    );
  }
}

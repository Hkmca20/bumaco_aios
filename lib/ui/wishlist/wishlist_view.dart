import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:get/get.dart';
import 'package:bumaco_aios/ui/shopping/model/models.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BumacoAppbar(title: 'wishlist'.tr),
      body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          itemCount: Product.productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 2.4),
          itemBuilder: (context, index) {
            return Center(
              child: ProductCard(product: Product.productList[index], widthFactor: 1.1,leftPosition: 150,isWishlist: true,),
            );
          }),
    );
  }
}

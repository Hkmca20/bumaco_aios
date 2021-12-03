import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/bucket_controller.dart';
import 'package:bumaco_aios/ui/controller/product_controller.dart';
import 'package:bumaco_aios/ui/shopping/cproduct_detail_view.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CSearchItem extends StatelessWidget {
  const CSearchItem({
    Key? key,
    required this.prod,
    this.index = 0,
    this.offset = 0.0,
    required this.bController,
    required this.pController,
  }) : super(key: key);

  final ProductController pController;
  final BucketController bController;
  final ProductModel prod;
  final double offset;
  final int index;

  @override
  Widget build(BuildContext context) {
    // final itemPositionOffset = index * itemSize;
    // final diff = offset - itemPositionOffset;
    // final percent = 1 - (diff / (itemSize));
    // final value = percent.clamp(0.0, 1.0);

    return InkWell(
      onTap: () {
        Get.back();
        Get.back();
        Get.to(() => CProductDetailView(),
            arguments: {'arg_product_item': prod});
      },
      child: ListTile(
              leading: Icon(
                Icons.search,
                color: kGreyLightColor,
              ),
              trailing: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: kGreyLightColor),
                  borderRadius: BorderRadius.circular(1.0),
                ),
                child: CachedNetworkImage(
                  imageUrl: ApiConstants.baseImageUrl + prod.fimage,
                  placeholder: (context, url) => AppLogoWidget(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              title: prod.product.text.capitalize.ellipsis
                  .maxLines(2)
                  .size(14)
                  .make()
                  .p2())
          .marginAll(6),
    );
  }
}

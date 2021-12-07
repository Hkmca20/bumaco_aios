import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/models/product_makeup_model.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class HeroCarouselCard11 extends StatelessWidget {
  final BannerModel? category;
  final ProductMakeupModel? product;
  const HeroCarouselCard11({Key? key, this.category, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.product == null) {
          Get.toNamed(productsRoute,
              arguments: {'arg_category_item': category});
          // Get.toNamed(catalogRoute, arguments: {'get_catalog': category});
        } else {
          Get.toNamed(productDetailRoute, arguments: {'get_product': product});
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: product == null
                          ? (ApiConstants.baseImageUrl + (category!.image))
                          : (ApiConstants.baseImageUrl +
                              (product!.imageLink ?? '')),
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                        product == null
                            ? category!.category
                            : product!.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

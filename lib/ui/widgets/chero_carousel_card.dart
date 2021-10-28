import 'package:bumaco_aios/app_core/models/product_model.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/shopping/model/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CHeroCarouselCard extends StatelessWidget {
  final Category? category;
  final ProductModel? product;
  const CHeroCarouselCard({Key? key, this.category, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.product == null) {
          Get.toNamed(catalogRoute, arguments: {'get_catalog': category});
        } else {
          Get.toNamed(productDetailRoute,
              arguments: {'arg_product_item': product});
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                    product == null
                        ? category!.categoryImgUrl
                        : ApiConstants.baseImageUrl + product!.fimage,
                    fit: BoxFit.cover,
                    width: 1000.0),
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
                            ? category!.categoryName
                            : '', //product!.produntName,
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

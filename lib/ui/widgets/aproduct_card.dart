import 'dart:math';

import 'package:bumaco_aios/app_core/models/product_makeup_model.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/shopping/product_detail_view1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AProductTile extends StatelessWidget {
  const AProductTile(
      {Key? key,
      required this.prod,
      this.index = 0,
      this.itemSize = 0,
      this.offset = 0.0})
      : super(key: key);

  final ProductMakeupModel prod;
  final double offset;
  final int index, itemSize;

  @override
  Widget build(BuildContext context) {
    final itemPositionOffset = index * itemSize;
    final diff = offset - itemPositionOffset;
    final percent = 1 - (diff / (itemSize));
    final value = percent.clamp(0.0, 1.0);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Get.to(ProductDetailView1(),
                arguments: {'arg_product': prod});
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      prod.imageLink ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Obx(() => CircleAvatar(
                          backgroundColor: Colors.white54,
                          child: IconButton(
                            icon: prod.isFavorite.value
                                ? Icon(Icons.favorite_rounded)
                                : Icon(Icons.favorite_border),
                            onPressed: () {
                              prod.isFavorite.toggle();
                              String s = prod.isFavorite.isTrue
                                  ? 'Added to'
                                  : 'Removed from';
                              bumacoSnackbar('Alert', '$s Wishlist');
                            },
                          ),
                        )),
                  )
                ],
              ),
              SizedBox(height: 8),
              Text(
                prod.name ?? '',
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              if (prod.rating != null)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        prod.rating.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Transform.rotate(
                        angle: pi * value,
                        child: Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 8),
              Text('\$${prod.price}', style: TextStyle(fontSize: 32)),
              SizedBox(height: 8),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    bumacoSnackbar('Alert', 'Adding to your cart list');
                  },
                  child: Text(
                    'Add to cart',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: kWhiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bumaco_aios/ui/shopping/model/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AProductTile extends StatelessWidget {
  const AProductTile({Key? key, required this.prod}) : super(key: key);

  final Products prod;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                    prod.imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
                // Positioned(
                //   right: 0,
                //   child: Obx(() => CircleAvatar(
                //         backgroundColor: Colors.white,
                //         child: IconButton(
                //           icon: prod.isFavorite.value
                //               ? Icon(Icons.favorite_rounded)
                //               : Icon(Icons.favorite_border),
                //           onPressed: () {
                //             prod.isFavorite.toggle();
                //           },
                //         ),
                //       )),
                // )
              ],
            ),
            SizedBox(height: 8),
            Text(
              prod.name,
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            if (prod.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      prod.rating.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            SizedBox(height: 8),
            Text('\$${prod.price}',
                style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
          ],
        ),
      ),
    );
  }
}

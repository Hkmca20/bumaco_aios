import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/shopping/model/category.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class StaggeredImg extends StatelessWidget {
  const StaggeredImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _shoppingController = ShoppingController.to;
    return Scaffold(
      backgroundColor: Colors.teal,
      // appBar: BumacoAppbar(title: 'StaggeredImg'),
      body: SafeArea(
          child: Column(
        children: [
          //HEADER
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'Bumaco',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.white),
                  //  TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                )),
                IconButton(
                    onPressed: () {
                      Get.toNamed(wishlistRoute);
                    },
                    icon: Icon(Icons.favorite_rounded, color: Colors.white)),
                IconButton(
                    onPressed: () {
                      Get.toNamed(offerRoute);
                    },
                    icon: Icon(Icons.view_list_rounded),
                    color: Colors.white),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.grid_view_outlined),
                    color: Colors.white),
                IconButton(
                    onPressed: () {
                      Get.toNamed(settingRoute);
                    },
                    icon: Icon(Icons.settings),
                    color: Colors.white),
              ],
            ),
          ),

          //All Items Home page
          Expanded(
            child: Obx(
              () => StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                itemCount: _shoppingController.products.length,
                itemBuilder: (context, index) => Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: _shoppingController.products[index].produntImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                staggeredTileBuilder: (int index) {
                  return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}

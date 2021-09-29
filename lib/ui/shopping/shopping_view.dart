import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/controller/cart_controller.dart';
import 'package:bumaco_aios/ui/controller/shopping_controller.dart';
import 'package:bumaco_aios/ui/shopping/model/category.dart';
import 'package:bumaco_aios/ui/shopping/model/product.dart';
import 'package:bumaco_aios/ui/widgets/hero_carousel_card.dart';
import 'package:bumaco_aios/ui/widgets/product_carousel.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage>
    with SingleTickerProviderStateMixin {
  // final _shoppingController = ShoppingController();
  // final _shoppingController = Get.put(ShoppingController());
  // final _cartController1 = Get.put(CartController());
  final _shoppingController = ShoppingController.to;
  final _cartController = CartController.to;
  late ScrollController _controller;

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        print('---scroll listener------->MAX_ScrollExtent()');
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        print('--scroll listener------->MIN_ScrollExtent');
      });
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener); //the listener for up and down.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      // appBar: AppBar(
      //   title: Text('Shopping Page'),
      // ),
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
                        .headline3!
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

            //MAIN CAROUSEL
            Expanded(
              child: Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enlargeCenterPage: true,
                  ),
                  items: Category.categoryList
                      .map((cat) => HeroCarouselCard(category: cat))
                      .toList(),
                ),
              ),
            ),
            //SECTION
            //PRODUCTS CAROUSEL
            SectionTile(title: 'TRENDING PRODUCTS'),
            ProductCarousel(
                products: Product.productList
                    .where((element) => element.isRecommended)
                    .toList()),
            SectionTile(title: 'NEW ARRIVAL PRODUCTS'),
            ProductCarousel(products: Product.productList.where((element) => element.isPopular).toList()),
            SectionTile(title: 'BEST SELLERS'),
            ProductCarousel(products: Product.productList.where((element) => element.isNew).toList()),

//SHOPPING LIST START HERE
            // Expanded(
            //   child: Obx(
            //     () => ListView.builder(
            //       controller: _controller,
            //       shrinkWrap: true,
            //       itemCount: _shoppingController.products.length,
            //       itemBuilder: (context, index) => Card(
            //         margin: EdgeInsets.all(12),
            //         child: Padding(
            //           padding: EdgeInsets.all(16),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.end,
            //             children: [
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text(
            //                         '${_shoppingController.products[index].produntName}',
            //                         style: TextStyle(fontSize: 24),
            //                       ),
            //                       Text(
            //                         '${_shoppingController.products[index].produntDescription}',
            //                         style: TextStyle(fontSize: 16),
            //                       ),
            //                     ],
            //                   ),
            //                   Text(
            //                     '${_shoppingController.products[index].produntPrice}',
            //                     style: TextStyle(fontSize: 20),
            //                   ),
            //                 ],
            //               ),
            //               ElevatedButton(
            //                   onPressed: () => {
            //                         _cartController.addItems(
            //                             _shoppingController.products[index]),
            //                       },
            //                   child: Text('Add To Cart')),
            //               Obx(
            //                 () => IconButton(
            //                     onPressed: () {
            //                       _shoppingController.products[index].isFavorite
            //                           .toggle();
            //                     },
            //                     icon: _shoppingController
            //                             .products[index].isFavorite.value
            //                         ? Icon(Icons.check_box_rounded)
            //                         : Icon(
            //                             Icons.check_box_outline_blank_rounded)),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            // GetBuilder<CartController>(
            //     builder: (controller) => Text(
            //           'Total Amount: ${controller.testAmount}',
            //           style: TextStyle(fontSize: 32, color: Colors.white),
            //         )),

            // GetX<CartController>(
            //     builder: (controller) => Text(
            //           'Total Amount: ${controller.testAmount}',
            //           style: TextStyle(fontSize: 32, color: Colors.white),
            //         )),

            // Obx(() => Text(
            //       'Total Amount: ${_cartController.totalPrice}',
            //       style: TextStyle(fontSize: 32, color: Colors.white),
            //     )),
            // SizedBox(height: 100)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              Get.toNamed(settingRoute);
            });
          },
          backgroundColor: Colors.amber,
          icon: Icon(
            Icons.add_shopping_cart,
            color: Colors.black,
          ),
          label: Obx(() => Text(
                _cartController.cartSize.toString(),
                style: TextStyle(color: Colors.black, fontSize: 24),
              ))),
    );
  }
}

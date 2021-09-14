import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/dummy/settings_controller.dart';
import 'package:bumaco_aios/ui/shopping/controller/cart_controller.dart';
import 'package:bumaco_aios/ui/shopping/controller/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
      appBar: AppBar(
        title: Text('Shopping Page'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    'Bumaco',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                  )),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.view_list_rounded)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.grid_view_outlined)),
                ],
              ),
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                itemBuilder: (context, index) => Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    // child: FadeInImage.memoryNetwork(
                    //     // placeholder: kTransparentImage,
                    //     placeholder: kTransparentImage,
                    //     image: _shoppingController.products[index].produntImage,fit: BoxFit.cover,),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                itemCount: _shoppingController.products.length,
                staggeredTileBuilder: (int index) {
                  return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                },
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  controller: _controller,
                  shrinkWrap: true,
                  itemCount: _shoppingController.products.length,
                  itemBuilder: (context, index) => Card(
                    margin: EdgeInsets.all(12),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_shoppingController.products[index].produntName}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    '${_shoppingController.products[index].produntDescription}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Text(
                                '${_shoppingController.products[index].produntPrice}',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () => {
                                    _cartController.addItems(
                                        _shoppingController.products[index]),
                                  },
                              child: Text('Add To Cart')),
                          Obx(
                            () => IconButton(
                                onPressed: () {
                                  _shoppingController.products[index].isFavorite
                                      .toggle();
                                },
                                icon: _shoppingController
                                        .products[index].isFavorite.value
                                    ? Icon(Icons.check_box_rounded)
                                    : Icon(
                                        Icons.check_box_outline_blank_rounded)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

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

            Obx(() => Text(
                  'Total Amount: ${_cartController.totalPrice}',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                )),
            SizedBox(height: 100)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              if (SettingsController.to.isDarkTheme)
                Get.changeTheme(ThemeData.dark());
              else
                Get.changeTheme(ThemeData.light());
              // Get.toNamed(settingRoute);
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

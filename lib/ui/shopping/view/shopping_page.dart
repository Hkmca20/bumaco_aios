import 'package:bumaco_aios/ui/shopping/controller/cart_controller.dart';
import 'package:bumaco_aios/ui/shopping/controller/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  // final _shoppingController = ShoppingController();
  // final _shoppingController = Get.put(ShoppingController());
  final _shoppingController = ShoppingController.to;
  final _cartController = CartController.to;
  late ScrollController _controller;

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
  }

/*
 * //Easy Key/value storage
 * GetStorage box = GetStorage();
 * box.write('key', value);
 * box.read('key');
 * 
 * //Easy Internationalisation
 * Text('Hello world'.tr);
 * Get.changeLocale(Locale('pt'));
 * 
 * //Easy Change Theme
 * Get.changeTheme(ThemeData.Dark);
 * 
 * //Easy Validator:
 * GetUtils.isEmail('abc@gmail.com') ? validate() :errorMessage();
 */
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener); //the listener for up and down.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('productSize: ${_shoppingController.products.length}');

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Shopping Page'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              // child: GetX<ShoppingController>(builder: (controller) =>
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Obx(() => Text(
                  'Total Amount: ${_cartController.totalPrice}',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                )),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
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

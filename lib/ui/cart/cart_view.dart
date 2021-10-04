import 'package:bumaco_aios/app_utils/app_bar_main.dart';
import 'package:bumaco_aios/ui/cart/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_data.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BumacoAppbar(
        title: 'Cart Demo',
      ),
      body: Container(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ChangeNotifierProvider(
              create: (context) => products[index],
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            'https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769',
                            width: 50,
                            height: 50,
                          ),
                          Expanded(child: Text(products[index].name)),
                          Consumer<CartItem>(
                            builder: (context, value, child) => Text(
                              products[index].totalPrice.toString(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              products[index].decrementCount();
                            },
                            icon: Icon(Icons.remove_circle),
                          ),
                          Consumer<CartItem>(
                            builder: (context, value, child) => Text(
                              products[index].count.toString(),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              products[index].incrementCount();
                            },
                            icon: Icon(Icons.add_circle),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

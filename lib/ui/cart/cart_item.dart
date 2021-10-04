import 'package:flutter/foundation.dart';

class CartItem extends ChangeNotifier {
  String name;
  double price ;

  CartItem({this.name ='', this.price= 0.0});

  int count = 1;
  double get totalPrice => price * count;

  incrementCount() {
    count++;
    notifyListeners();
  }

  decrementCount() {
    count--;
    notifyListeners();
  }
}
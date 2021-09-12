import 'package:bumaco_aios/ui/shopping/model/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get to => Get.find(tag: '_cart_controller');

  var cartItems = <Product>[].obs;

  int get cartSize => cartItems.length;

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.produntPrice);

  addItems(product) {
    cartItems.add(product);
    print('cartSize=${cartItems.length}');
  }
}

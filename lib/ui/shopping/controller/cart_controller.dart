import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/shopping/model/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get to => Get.find(tag: CART_CONTROLLER);

  var cartItems = <Product>[].obs;

  int get cartSize => cartItems.length;

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.produntPrice);

  // var testAmount = 0.0;//to implement GetBuilder and learn diff of (GetX, Obx)

  addItems(product) {
    cartItems.add(product);
    print('cartSize=${cartItems.length}');
    // testAmount = totalPrice;
    // update();
  }
}

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/shopping/model/models.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  // static ShoppingController get to => Get.find<ShoppingController>();
  static ShoppingController get to => Get.find(tag: SHOPPING_CONTROLLER);

  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    // called immediately after the widget is allocated memory
    print('------------onInit(1)');
    fetchProducts();
  }

  @override
  void onReady() {
    // print(Get.context);
    print('------------onReady(1)');
    // called after the widget is rendered on screen
    super.onReady();
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory
    print('------------onClose(1)');
    super.onClose();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(microseconds: 300));
    
    products.value = Product.productList;
  }
}

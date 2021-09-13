import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/shopping/model/product.dart';
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
    var productResults = [
      Product(
          id: 1,
          produntName: 'First Product',
          produntImage: 'img1',
          produntDescription: 'ProduntDescription 1',
          produntPrice: 30.5),
      Product(
          id: 2,
          produntName: 'Second Product',
          produntImage: 'img1',
          produntDescription: 'ProduntDescription 2',
          produntPrice: 40.5),
      Product(
          id: 3,
          produntName: 'Third Product',
          produntImage: 'img1',
          produntDescription: 'ProduntDescription 3',
          produntPrice: 50.2),
      Product(
          id: 4,
          produntName: 'Fourth Product',
          produntImage: 'img1',
          produntDescription: 'ProduntDescription 4',
          produntPrice: 60.1),
      Product(
          id: 5,
          produntName: 'Fifth Product',
          produntImage: 'img1',
          produntDescription: 'ProduntDescription 5',
          produntPrice: 70.7),
      Product(
          id: 6,
          produntName: 'Sixth Product',
          produntImage: 'img1',
          produntDescription: 'ProduntDescription 6',
          produntPrice: 80.8),
      Product(
          id: 7,
          produntName: 'Seventh Product',
          produntImage: 'img1',
          produntDescription: 'ProduntDescription 7',
          produntPrice: 90.9),
      Product(
          id: 8,
          produntName: 'Eighth Product',
          produntImage: 'img1',
          produntDescription: 'ProduntDescription 8',
          produntPrice: 100.1),
      Product(
          id: 9,
          produntName: 'Ninth Product',
          produntImage: 'img9',
          produntDescription: 'ProduntDescription 9',
          produntPrice: 100.2),
      Product(
          id: 10,
          produntName: 'Tenth Product',
          produntImage: 'img10',
          produntDescription: 'ProduntDescription 10',
          produntPrice: 100.3),
    ];
    products.value = productResults;
  }
}

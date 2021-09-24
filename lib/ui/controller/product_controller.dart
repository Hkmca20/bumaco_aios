import 'package:bumaco_aios/network/api_manager.dart';
import 'package:bumaco_aios/ui/shopping/model/products.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  List<Products> productList = <Products>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    try {
      isLoading(true);
      var products = ApiManager().fetchProducts() as List<Products>;
      if (products != products) {
        productList = products;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}

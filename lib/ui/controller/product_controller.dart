import 'package:bumaco_aios/app_core/repository/product_repo.dart';
import 'package:bumaco_aios/app_core/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;
  late ProductRepository productRepository;

  @override
  void onInit() {
    productRepository = Get.put(ProductRepositoryImpl());
    fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    try {
      isLoading(true);
      // var products =await ApiManager().fetchProducts() as List<ProductModel>;
      var products = await productRepository.getProduct();
      if (products != null) {
        productList.value = products;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}

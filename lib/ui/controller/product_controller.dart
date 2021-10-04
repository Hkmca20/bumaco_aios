import 'package:bumaco_aios/app_core/repository/product_repo.dart';
import 'package:bumaco_aios/app_core/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var columnCount = 2.obs;
  var productList = <ProductModel>[].obs;
  late ProductRepository productRepository;
  late ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    productRepository = Get.put(ProductRepositoryImpl());
    fetchProducts();
    addScrollListener();
    super.onInit();
  }

  var offset = 0.0.obs;
  addScrollListener() {
    scrollController.addListener(() {
    offset.value = scrollController.offset;
    // print(scrollController.offset);
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // _getmoreData();
        fetchProducts();
      }
    });
  }

  changeColumnCount(int count) {
    columnCount.value = count;
  }

  fetchProducts() async {
    try {
      isLoading(true);
      // var products =await ApiManager().fetchProducts() as List<ProductModel>;
      var products = await productRepository.getProduct();
      if (products != null) {
        productList.addAll(products);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}

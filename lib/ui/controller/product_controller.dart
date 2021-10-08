import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var columnCount = 2.obs;
  var productList = <ProductModel>[].obs;
  var allProductList = <ProductModel>[].obs;
  late ProductRepository productRepository;
  late ScrollController scrollController = ScrollController();

  var categoryId = '';
  setCategoryId(categoryId) {
    this.categoryId = categoryId;
    fetchProductsById(categoryId);
  }

  @override
  void onInit() {
    productRepository = Get.put(ProductRepositoryImpl());
    addScrollListener();
    fetchAllProducts();
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
        // fetchProducts(categoryId);
      }
    });
  }

  changeColumnCount(int count) {
    columnCount.value = count;
  }

  fetchProductsById(categoryId) async {
    try {
      isLoading(true);
      var products = await productRepository.getProduct(categoryId);
      if (products != null) {
        productList.value = products;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  fetchAllProducts() async {
    try {
      isLoading(true);
      var products = await productRepository.getProductAll();
      if (products != null) {
        allProductList.value = products;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}

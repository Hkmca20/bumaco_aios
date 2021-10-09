import 'package:bumaco_aios/app_core/db/database/database.dart';
import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/product_repo.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController with StateMixin, ScrollMixin {
  var isLoading = true.obs;
  var isToLoadMore = true;
  var columnCount = 2.obs;
  var favouriteList = <ProductModel>[].obs;
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
        isToLoadMore = true;
      } else {
        isToLoadMore = false;
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
        isToLoadMore = true;
      } else {
        isToLoadMore = false;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  getFavouriteList() async {
    isLoading(true);
   await Future.delayed(Duration(milliseconds: 500));
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final favDao = db.favouriteDao;
    final result = await favDao.findAllFavourites();
    isLoading(false);
    favouriteList.value = result;
  }

  insertFavourite(ProductModel item) async {
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final favDao = db.favouriteDao;
    await favDao.insertIntoFavourite(item);
  }

  // _saveCall() {
  //   final database = $FloorAppDatabase.databaseBuilder('tododatabase.db').build();
  //   database.then((onValu){
  //   onValu.todoDao.getMaxTodo().then((onValue){
  //     int id = 1;
  //     if(onValue != null){
  //      id=onValue.id+1;
  //     }
  //     onValu.todoDao.insertTodo(Todo(id,widget._textEditingController.value.text,DateFormat('dd-mm-yyyy kk:mm').format(DateTime.now()),""));
  //   });
  // });
  //   Navigator.pop(context);
  // }
  @override
  Future<void> onEndScroll() async {
    // if (isToLoadMore) {
    //   page++;
    //   await loadData();
    // }
    print("onEngScroll: Called");
  }

  @override
  Future<void> onTopScroll() async {
    print("onTopScroll: Called");
  }
}

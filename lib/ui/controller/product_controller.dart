import 'package:bumaco_aios/app_core/db/database/database.dart';
import 'package:bumaco_aios/app_core/db/entity/favorite_entity.dart';
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
        productList.forEach((e1) {
          products.forEach((e2) {
            if (e1.id == e2.id) {
              e1.isFavorite.value = true;
            }
          });
        });
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
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final favDao = db.favouriteDao;
    final result = await favDao.findAllFavourites();
    favouriteList.clear();
    result.forEach((element) {
      ProductModel item = ProductModel(
        category: element.category,
        childcategory: element.childcategory,
        subcategory: element.subcategory,
        id: element.id,
        brand: element.brand,
        createdate: element.createdate,
        description: element.description,
        shortDescription: element.shortDescription,
        fimage: element.fimage,
        hasvery: element.hasvery,
        mrp: element.mrp,
        product: element.product,
        productUrl: element.productUrl,
      );
      item.isFavorite.value = true;
      favouriteList.add(item);
    });
  }

  insertFavourite(ProductModel element) async {
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final favDao = db.favouriteDao;
    final FavouriteEntity? checkItem =
        await favDao.findFavouriteById(element.id);
    if (checkItem != null && checkItem.id == element.id) {
      bumacoSnackbar('Alert', 'Already added to your wishlist!');
      return;
    }
    final entity = FavouriteEntity(
      category: element.category,
      childcategory: element.childcategory,
      subcategory: element.subcategory,
      id: element.id,
      brand: element.brand,
      createdate: element.createdate,
      description: element.description,
      shortDescription: element.shortDescription,
      fimage: element.fimage,
      hasvery: element.hasvery,
      mrp: element.mrp,
      product: element.product,
      productUrl: element.productUrl,
    );
    await favDao.insertIntoFavourite(entity);
    getFavouriteList();
    bumacoSnackbar('Alert', '${entity.product} is added to your wishlist!');
  }

  removeFavourite(item) async {
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final favDao = db.favouriteDao;
    await favDao.deleteFavourireById(item.id);
    getFavouriteList();
    bumacoSnackbar('Alert', '${item.product} is removed to your wishlist!');
  }
  
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

import 'dart:async';

import 'package:bumaco_aios/app_core/db/database/app_database.dart';
import 'package:bumaco_aios/app_core/db/entity/favorite_entity.dart';
import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/product_repo.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/onboard/model/onboard_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController with StateMixin, ScrollMixin {
  static ProductController get to => Get.find(tag: PRODUCT_CONTROLLER);

  var isLoading = true.obs;
  var isToLoadMore = true;
  var columnCount = 2.obs;
  var favouriteList = <ProductModel>[].obs;
  var productList = <ProductModel>[].obs;
  var allProductList = <ProductModel>[].obs;
  late ProductRepository productRepository;
  late ScrollController scrollController = ScrollController();
  var currIndex = 0.obs;
  bool get isLastPage => currIndex.value == bannerList.length - 1;
  var pageController = PageController();
  List<BannerItem> bannerList = [];
  // late Timer _timer;

  void timerCallback(Timer timer) {
    print('timer callback active ===' + timer.tick.toString());
    forwardAction();
  }

  forwardAction() {
    if (isLastPage) {
      currIndex.value = 0;
      // _timer.cancel();
    } else {
      currIndex = currIndex + 1;
    }
    // pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    pageController.animateToPage(currIndex.value,
        duration: 300.milliseconds, curve: Curves.linear);
  }

  _addItemToList() {
    bannerList.add(
      BannerItem(
          'https://brandhype.co.in/bumaco/uploads/20210930100936_4655011.jpg',
          'Makeup A',
          'Descrip A'),
    );
    bannerList.add(
      BannerItem(
          'https://brandhype.co.in/bumaco/uploads/20210921100958_123815.jpg',
          'Makeup B',
          'Descrip B'),
    );
    bannerList.add(
      BannerItem(
          'https://brandhype.co.in/bumaco/uploads/20210921100958_566827.jpg',
          'Makeup C',
          'Descrip C'),
    );
    bannerList.add(
      BannerItem(
          'https://brandhype.co.in/bumaco/uploads/20210921090902_637035.jpg',
          'Makeup D',
          'Descrip D'),
    );
    bannerList.add(
      BannerItem(
          'https://brandhype.co.in/bumaco/uploads/20210921090917_488404.jpg',
          'Makeup E',
          'Descrip E'),
    );
    bannerList.add(
      BannerItem(
          'https://brandhype.co.in/bumaco/uploads/20210921090902_513258.jpg',
          'Makeup F',
          'Descrip F'),
    );
    bannerList.add(
      BannerItem(
          'https://brandhype.co.in/bumaco/uploads/20210921080915_492297.jpg',
          'Makeup G',
          'Descrip G'),
    );
    bannerList.add(
      BannerItem(
          'https://brandhype.co.in/bumaco/uploads/20210930100936_4655011.jpg',
          'Makeup H',
          'Descrip H'),
    );
    bannerList.add(
      BannerItem(
          'https://brandhype.co.in/bumaco/uploads/20210930100936_4655011.jpg',
          'Makeup I',
          'Descrip I'),
    );
    bannerList.add(
      BannerItem(
          'https://brandhype.co.in/bumaco/uploads/20210930100936_4655011.jpg',
          'Makeup J',
          'Descrip J'),
    );
  }

  var categoryId = '';
  setCategoryId(categoryId) {
    this.categoryId = categoryId;
    fetchProductsById(categoryId);
  }

  @override
  void onInit() {
    productRepository = Get.put(ProductRepositoryImpl());
    // addScrollListener();
    fetchAllProducts();
    _addItemToList();
    // _timer = Timer.periodic(Duration(seconds: 3), timerCallback);
    super.onInit();
  }

  @override
  void onClose() {
    // _timer.cancel();
    scrollController.removeListener(() {
      print('product scrollControl removed');
    });
    super.onClose();
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
      bumacoSnackbar(
          'alert'.tr, 'already'.tr + 'added_to'.tr + ' ' + 'wishlist'.tr);
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
    bumacoSnackbar(
        'alert'.tr, '${entity.product} ' + 'added_to'.tr + ' ' + 'wishlist'.tr);
  }

  removeFavourite(item) async {
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final favDao = db.favouriteDao;
    await favDao.deleteFavourireById(item.id);
    getFavouriteList();
    bumacoSnackbar('alert'.tr,
        '${item.product} ' + 'removed_from'.tr + ' ' + 'wishlist'.tr);
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

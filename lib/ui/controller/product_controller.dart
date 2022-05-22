import 'dart:async';

import 'package:bumaco_aios/app_core/db/database/app_database.dart';
import 'package:bumaco_aios/app_core/db/entity/favorite_entity.dart';
import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_core/repository/repository.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/bucket_controller.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController with StateMixin, ScrollMixin {
  static ProductController get to => Get.find(tag: PRODUCT_CONTROLLER);

  var isLoading = false.obs;
  var isToLoadMore = true;
  var columnCount = 2.obs;
  var productListFavourite = <ProductModel>[].obs;
  var productListSearch = <ProductModel>[].obs;
  var productList = <ProductModel>[].obs;
  var productListAll = <ProductModel>[].obs;
  var productListHome = <ProductModel>[].obs;
  late ProductRepository productRepository;
  ScrollController scrollController = ScrollController();
  var currIndex = 0.obs;
  bool get isLastPage => currIndex.value == bannerList.length - 1;
  var pageController = PageController();
  List<BannerModel> bannerList = [];
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
      BannerModel(
          image: '20210930100936_4655011.jpg',
          bannertext: 'Makeup A',
          category: 'Descrip A'),
    );
    bannerList.add(
      BannerModel(
          image: '20210921100958_123815.jpg',
          bannertext: 'Makeup B',
          category: 'Descrip B'),
    );
    bannerList.add(
      BannerModel(
          image: '20210921100958_566827.jpg',
          bannertext: 'Makeup C',
          category: 'Descrip C'),
    );
    bannerList.add(
      BannerModel(
          image: '20210921090902_637035.jpg',
          bannertext: 'Makeup D',
          category: 'Descrip D'),
    );
    bannerList.add(
      BannerModel(
          image: '20210921090917_488404.jpg',
          bannertext: 'Makeup E',
          category: 'Descrip E'),
    );
    bannerList.add(
      BannerModel(
          image: '20210921090902_513258.jpg',
          bannertext: 'Makeup F',
          category: 'Descrip F'),
    );
    bannerList.add(
      BannerModel(
          image: '20210921080915_492297.jpg',
          bannertext: 'Makeup G',
          category: 'Descrip G'),
    );
    bannerList.add(
      BannerModel(
          image: '20210930100936_4655011.jpg',
          bannertext: 'Makeup H',
          category: 'Descrip H'),
    );
  }

  var categoryId = '';
  setCategoryId(categoryId) {
    this.categoryId = categoryId;
    fetchProductsById(categoryId);
  }

  var categoryItem = CategoryData(id: '0', category: 'Product List');

  var sortFilterText = ''.obs;
  searchSortFilterProducts(str) {
    print('searchSortFilterString===========$str');
    sortFilterText.value = str;
    fetchProductsBySearch(str);
  }

  openProductDetail(ProductModel productItem) {
    Get.toNamed(productDetailRoute,
        arguments: {'arg_product_item': productItem});
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      categoryItem = Get.arguments[ARG_CATEGORY_ITEM];
    }
    productRepository = Get.put(ProductRepositoryImpl());
    // addScrollListener();
    getFavouriteList();
    fetchProductAll();
    fetchProductHome();
    _addItemToList();
    // _timer = Timer.periodic(Duration(seconds: 3), timerCallback);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(() {
      print('product scrollControl removed------');
    });
    scrollController.dispose();
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

  fetchProductsBySearch(searchStr) async {
    try {
      // isLoading(true);
      var result = await productRepository.getProductSearch(searchStr);
      if (result != null) {
        productListSearch(result);
      } else {
        productListSearch.clear();
      }
    } catch (e) {
      print(e);
    } finally {
      // isLoading(false);
    }
  }

  String get selectedGateId => getStorageStringValue(BOX_GATE_SELECTED_ID) == ''
      ? "1"
      : getStorageStringValue(BOX_GATE_SELECTED_ID);

  fetchProductsById(categoryId) async {
    try {
      isLoading(true);
      var products =
          await productRepository.getProductById(selectedGateId, categoryId);
      if (products != null) {
        checkIsFavorites(products);
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

  fetchProductAll() async {
    try {
      isLoading(true);
      var products = await productRepository.getProductAll();
      if (products != null) {
        print(products.length);
        checkIsFavorites(products);
        productListAll(products);
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

  fetchProductHome() async {
    try {
      isLoading(true);
      var result = await productRepository.getProductHome();
      if (result != null) {
        checkIsFavorites(result);
        productListHome(result);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

//----------------------following code for favourite /wishlist of product--------------------database -----------
  getFavouriteList() async {
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final favDao = db.favouriteDao;
    final result = await favDao.findAllFavourites();
    productListFavourite.clear();
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
      productListFavourite.add(item);
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
    // bumacoSnackbar(
    //     'alert'.tr, '${entity.product} ' + 'added_to'.tr + ' ' + 'wishlist'.tr);
  }

  removeFavourite(item) async {
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final favDao = db.favouriteDao;
    await favDao.deleteFavourireById(item.id);
    getFavouriteList();
    checkRemoveFavorites(item);
    // bumacoSnackbar('alert'.tr,
    //     '${item.product} ' + 'removed_from'.tr + ' ' + 'wishlist'.tr);
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

  void checkIsFavorites(List<ProductModel> products) {
    products.forEach((e1) {
      productListFavourite.forEach((e2) {
        if (e1.id == e2.id) {
          e1.isFavorite(true);
        }
      });
    });
  }

  void checkRemoveFavorites(item) {
    productList.forEach((e) {
      if (item.id == e.id) {
        e.isFavorite(false);
      }
    });
    productListAll.forEach((e) {
      if (item.id == e.id) {
        e.isFavorite(false);
      }
    });
  }
}

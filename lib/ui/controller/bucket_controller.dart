import 'package:bumaco_aios/app_config/app_environment.dart';
import 'package:bumaco_aios/app_core/db/database/app_database.dart';
import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/views/orders/order_book_view.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BucketController extends GetxController {
  static BucketController get to => Get.find(tag: BUCKET_CONTROLLER);
  var isLoading = true.obs;
  var bucketList = <BucketEntity>[].obs;
  var totalAmount = 0.0.obs;
  var taxPercent = 1.0;
  var taxAmount = 0.0.obs;
  var discountAmt = 0.0.obs;
  var shippingAmt = 0.0.obs;
  var grandTotal = 0.0.obs;
  late final Razorpay _razorpay;
  var isShowDetails = true.obs;

  @override
  void onInit() {
    super.onInit();
    getAllBucketFromLocal();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  initiatePayment(payableAmount) {
    String a = payableAmount.value.toStringAsFixed(2);
    int amt = int.parse(a.replaceAll('.', ''));
    if (amt > 35000) amt = 35000;
    String d = '';
    for (int i = 0; i < bucketList.length; i++) {
      if (d.length < 25) {
        d = d + bucketList[i].product.toString();
      } else {
        if (d.length > 25) {
          d = d.substring(0, 25) + '..';
        }
        d = d + ' + ${bucketList.length - 1} more';
        break;
      }
    }
    var options = {
      'key': AppEnvironment.razorpayKey,
      'amount': amt, //integer => in the smallest currency sub-unit.
      'currency': getStorageStringValue(BOX_CURRENCY),
      'name': getStorageStringValue(BOX_NAME),
      // 'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
      'description': d,
      'timeout': 60, // seconds
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': getStorageStringValue(BOX_MOBILE),
        'email': getStorageStringValue(BOX_EMAIL)
      },
      'external': {
        'wallets': ['paytm']
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    final tempAmount = grandTotal.value;
    print('payment successfully done!');
    bumacoSnackbar('alert'.tr, 'SUCCESS: ${response.paymentId}');
    removeAllBucket(true);
    showLoadingDialog();
    await Future.delayed(2.seconds);
    Get.back();
    Get.to(() => OrderBookView(), arguments: {
      ARG_PAYABLE_AMT: tempAmount,
      ARG_PAYMENT_ID: response.paymentId,
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print('ERROR: ${response.code} - ${response.message}');
    bumacoSnackbar('alert'.tr, 'PAYMENT FAILED: ${response.code}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    print('payment external wallet');
    bumacoSnackbar('alert'.tr, 'EXTERNAL_WALLET: ${response.walletName}');
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }

  updateBucketList(buckets) {
    bucketList.value = buckets;
    update();
  }

  getAllBucketFromLocal() async {
    try {
      final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
      final bucketDao = db.bucketDao;
      final result = await bucketDao.findAllBucket();
      updateBucketList(result);
      totalAmount.value = 0.0;
      taxAmount.value = 0.0;
      shippingAmt.value = 0.0;
      grandTotal.value = 0.0;
      var tempMrp = 0.0;
      result.forEach((element) {
        if (element.mrp != '') {
          tempMrp = double.parse(element.mrp);
        }
        element.totalPrice = element.quantity * tempMrp;
        totalAmount.value += element.quantity * tempMrp;
      });
      taxAmount.value = (totalAmount * taxPercent) / 100;
      if (totalAmount > 0 && totalAmount < 2000) shippingAmt.value = 350.0;
      grandTotal.value =
          totalAmount.value + taxAmount.value + shippingAmt.value;
    } on Exception catch (e) {
      print(e);
      bumacoSnackbar('alert'.tr, 'Happy: $e');
    }
  }

  insertBucket(ProductModel element) async {
    if (element.id == '') {
      bumacoSnackbar('alert'.tr, 'Internal Server Error!');
      return;
    }
    try {
      FirebaseCrashlytics.instance.setCustomKey(
          'CrashCustomKey', 'Initiate flutterfireHari-insertBucket(element)');

      final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
      final bucketDao = db.bucketDao;
      final BucketEntity? checkItem =
          await bucketDao.findBucketById(element.id);
      if (checkItem != null && checkItem.id == element.id) {
        final q = checkItem.quantity + 1;
        if (q > 5) {
          bumacoSnackbar('alert'.tr, 'allowed_max_5_qua'.tr);
          return;
        }
        bucketDao.updateQuantityInBucket(q, checkItem.id);
        getAllBucketFromLocal();
        // bumacoSnackbar(
        //     'alert'.tr, '${element.product} ' + 'quantity_updated'.tr);
        return;
      }
      final entity = BucketEntity(
          category: element.category.trim(),
          childcategory: element.childcategory.trim(),
          subcategory: element.subcategory.trim(),
          id: element.id,
          brand: element.brand.trim(),
          createdate: element.createdate,
          description: element.description.trim(),
          shortDescription: element.shortDescription.trim(),
          fimage: element.fimage,
          hasvery: element.hasvery,
          mrp: element.mrp,
          product: element.product.trim(),
          productUrl: element.productUrl,
          isBucket: true,
          quantity: 1);
      await bucketDao.insertIntoBucket(entity);
      getAllBucketFromLocal();
      // bumacoSnackbar(
      //     'alert'.tr, '${entity.product} ' + 'added_to'.tr + ' ' + 'cart'.tr);
    } on Exception catch (e, s) {
      print(e);
      bumacoSnackbar('alert'.tr, 'Happy: $e');
      await FirebaseCrashlytics.instance.recordError(e, s,
          reason: 'as an example of fatal error', fatal: true);
    }
  }

  increDecreQuantity(BucketEntity entity, bool increment) async {
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final bucketDao = db.bucketDao;
    final q = increment ? (entity.quantity + 1) : (entity.quantity - 1);
    if (q <= 0) {
      bucketDao.deleteBucketById(entity.id);
      getAllBucketFromLocal();
      bumacoSnackbar(
          'Alert', '${entity.product} ' + 'removed_from'.tr + ' ' + 'cart'.tr);
      return;
    } else if (q > 5) {
      bumacoSnackbar('alert'.tr, 'allowed_max_5_qua'.tr);
      return;
    }
    bucketDao.updateQuantityInBucket(q, entity.id);
    getAllBucketFromLocal();
    bumacoSnackbar('Alert', '${entity.product} ' + 'quantity_updated'.tr);
  }

  removeBucket(entity) async {
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final bucketDao = db.bucketDao;
    final BucketEntity? checkItem = await bucketDao.findBucketById(entity.id);
    if (checkItem != null && checkItem.id == entity.id) {
      if (checkItem.quantity > 1) {
        final quantity = checkItem.quantity - 1;
        bucketDao.updateQuantityInBucket(quantity, checkItem.id);
      } else {
        bucketDao.deleteBucketById(entity.id);
        bumacoSnackbar('alert'.tr,
            '${entity.product} ' + 'removed_from'.tr + ' ' + 'cart'.tr);
      }
      getAllBucketFromLocal();
    }
  }

  removeAllBucket(paid) async {
    try {
      FirebaseCrashlytics.instance
          .setCustomKey('CrashCustomKey', 'flutterfireHari-removeAllBucket()');
      final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
      final bucketDao = db.bucketDao;
      bucketDao.deleteAllBucket();
    } on Exception catch (e) {
      print(e);
      bumacoSnackbar('alert'.tr, 'Happy: $e');
    }
    if (!paid)
      bumacoSnackbar(
          'alert'.tr, 'All data ' + 'removed_from'.tr + ' ' + 'cart'.tr);
    getAllBucketFromLocal();
    // FirebaseCrashlytics.instance.crash();
  }
}

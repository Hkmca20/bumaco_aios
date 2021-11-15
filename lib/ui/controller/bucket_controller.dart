import 'package:bumaco_aios/app_core/db/database/app_database.dart';
import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/views/home/book_order_view.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BucketController extends GetxController {
  static BucketController get to => Get.find(tag: BUCKET_CONTROLLER);
  late String currency;
  var isLoading = true.obs;
  var bucketList = <BucketEntity>[].obs;
  var totalAmount = 0.0.obs;
  var taxPercent = 1.0;
  var taxAmount = 0.0.obs;
  var discountAmt = 0.0.obs;
  var shippingAmt = 0.0.obs;
  var grandTotal = 0.0.obs;
  late final Razorpay _razorpay;

  @override
  void onInit() {
    super.onInit();
    currency = getStorageStringValue(BOX_CURRENCY);
    if (currency == '') currency = 'GBP';
    getAllBucketFromLocal();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  initiatePayment(payableAmount) {
    var options = {
      'key': 'rzp_test_K91R0TzxmZMA2R', //process.env.RAZORPAY_KEY,//
      'amount': 100, //in the smallest currency sub-unit.
      'currency': 'INR',
      'name': 'Hariom Gupta',
      // 'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
      'description': 'Fine T-Shirt',
      'timeout': 60, // seconds
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': '8470874534',
        'email': 'hariom.brandhype@gmail.com'
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
    print('payment success');
    bumacoSnackbar('alert'.tr, 'SUCCESS: ${response.paymentId}');
    removeAllBucket(true);
    showLoadingDialog();
    await Future.delayed(2.seconds);
    Get.back();
    Get.to(() => BookOrderView(), arguments: {
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
    grandTotal.value = totalAmount.value + taxAmount.value + shippingAmt.value;
  }

  insertBucket(ProductModel element) async {
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final bucketDao = db.bucketDao;
    final BucketEntity? checkItem = await bucketDao.findBucketById(element.id);
    if (checkItem != null && checkItem.id == element.id) {
      final q = checkItem.quantity + 1;
      if (q > 5) {
        bumacoSnackbar('alert'.tr, 'allowed_max_5_qua'.tr);
        return;
      }
      bucketDao.updateQuantityInBucket(q, checkItem.id);
      getAllBucketFromLocal();
      bumacoSnackbar('alert'.tr, '${element.product} ' + 'quantity_updated'.tr);
      return;
    }
    final entity = BucketEntity(
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
        isBucket: true,
        quantity: 1);
    await bucketDao.insertIntoBucket(entity);
    getAllBucketFromLocal();
    bumacoSnackbar(
        'alert'.tr, '${entity.product} ' + 'added_to'.tr + ' ' + 'cart'.tr);
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
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final bucketDao = db.bucketDao;
    bucketDao.deleteAllBucket();
    if (!paid)
      bumacoSnackbar(
          'alert'.tr, 'All data ' + 'removed_from'.tr + ' ' + 'cart'.tr);
    getAllBucketFromLocal();
  }
}

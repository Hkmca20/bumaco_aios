import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get to => Get.find(tag: CHECKOUT_CONTROLLER);
  late String currency;

  @override
  void onInit() {
    super.onInit();
    currency = getStorageStringValue(BOX_CURRENCY);
    if (currency == '') currency = 'GBP';
    // StripePayment.setOptions(StripeOptions(
    //     publishableKey: "YOUR_PUBLISHABLE_KEY",
    //     merchantId: "YOUR_MERCHANT_ID",
    //     androidPayMode: 'test'));
  }
}

//**
//{"key":"NTZmNWIwNGZhODc1MmUyY2YxOTM5NmM0","events":[],"context":{"mode":"test","device":{"manufacturer":"Xiaomi","model":"Redmi Note 8 Pro","name":"begoniain","type":"phone","version":"Android11","Xiaomi":"Xiaomi","Redmi Note 8 Pro":"Redmi Note 8 Pro","device_size":"1080w X 2220h","device_resolution":"1080x2220x440"},"sdk":{"version":"1.6.10","type":"checkout"},"network":{"bluetooth":false,"carrier":"IND airtel","cellular":true,"cellular_network_type":"NA","wifi":false,"carrier_network":"IND airtel","network_type":-1,"is_roming":false},"screen":{"density":2.75,"width":1080,"height":2220},"locale":"en-IN","timezone":"Asia\/Kolkata","user_agent":"Dalvik\/2.1.0 (Linux; U; Android 11; Redmi Note 8 Pro Build\/RP1A.200720.011)","webview_user_agent":"Mozilla\/5.0 (Linux; Android 11; Redmi Note 8 Pro Build\/RP1A.200720.011; wv) AppleWebKit\/537.36 (KHTML, like Gecko) Version\/4.0 Chrome\/95.0.4638.74 Mobile Safari\/537.36"}}
// */
import 'dart:math';

import 'package:bumaco_aios/app_config/app_environment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';

// Flavours
const bool kReleaseMode = true;

// Colors
final commonGreyColor = Colors.grey[600]!.withOpacity(0.1);
const kPrimaryColor = Colors.pink; //Color(0xFFFF7643);
const kPrimaryColorDark = Colors.redAccent;
const kAccentColor = Colors.tealAccent;
const kPrimaryLightColor = Color(0xFFFFECDF);
const lightBackgroundColor = Color(0xff374ABE);
const gradientColorBlue1 = Color(0xff64B6FF);
const gradientColorBlue2 = Color(0xff64B6FF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kGreyLightColor = Color(0xFF979797);
const kDarkGreyColor = Color(0xFF757575);
const kWhiteColor = Colors.white;
const kBlackColor = Colors.black;
const kTransparentColor = Colors.transparent;
const kScafoldBGColor = Colors.transparent;
const kScafoldDarkBGColor = Colors.teal;
const kAppbarBGColor = Color(0x55979797);

// String
// const _charsAll =
//     'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
// const _charsUpper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
const _charsLower = 'abcdefghijklmnopqrstuvwxyz';
const appNameEN = '9Gates';
const appNameAE = '9 بوابات';
const appTitleEN = '9Gates';
const appTitleAE = '9 بوابات';
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kPhoneNumber10digit = "Please Enter 10 digit mobile number";
const String kInvalidChar = "Invalid character";
const String kPasswordError = "Invalid password";
const String kValidNumber = "Invalid number";
const String kOtpNullError = "Please Enter your phone number";
const String kValidEmail = "Invalid email id";
const String kOtp4digit = "Please Enter correct otp";

//ALL ARGUMENTS
const String ARG_PAYABLE_AMT = 'arg_payable_amt';
const String ARG_PAYMENT_ID = 'arg_payment_id';
const String ARG_CATEGORY_ITEM = 'arg_category_item';

// Pattxzerns
final RegExp patternNumeric = RegExp(r'\d');
final RegExp patternA2Z = RegExp('[a-zA-Z]');
final RegExp patternMobile = RegExp(r'(^(?:[+0]9)?[0-9]{6,12}$)');
final RegExp patternPhone =
    RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');
final RegExp patternEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

// Padding
const double paddingZero = 0.0;
const double paddingXS = 2.0;
const double paddingS = 4.0;
const double paddingM = 8.0;
const double paddingL = 16.0;
const double paddingXL = 32.0;

// Margin
const double marginZero = 0.0;
const double marginXS = 2.0;
const double marginS = 4.0;
const double marginM = 8.0;
const double marginL = 16.0;
const double marginXL = 32.0;

// Spacing
const double spaceXS = 2.0;
const double spaceS = 4.0;
const double spaceM = 8.0;
const double spaceL = 16.0;
const double spaceXL = 32.0;

// Assets
const String designPatternsJsonPath = 'assets/data/design_patterns.json';
const String markdownPath = 'assets/markdown/';

// Routes
const initialRoute = '/';
const onboardRoute = '/onboard';
const signinRoute = '/signin';
const signupRoute = '/signup';
const authRoute = '/auth';
const gateRoute = '/gate';
const landingRoute = '/landing';
const passRoute = '/pass';
const otpRoute = '/otp';
const profileRoute = '/profile';
const shoppingRoute = '/shopping';
const staggerdImgRoute = '/staggerdImg';
const cSearchRoute = '/cSearch';
const productsRoute = '/products';
const cProductRoute = '/cProducts';
const allProductsRoute = '/allProducts';
const bucketRoute = '/bucket';
const favouriteRoute = '/favourite';
const catalogRoute = '/catalog';
const productDetailRoute = '/product_detail';
const wishlistRoute = '/wishlist';
const offerRoute = '/offer';
const ratingRoute = '/rating';
const shrinkRoute = '/shrink';
const settingRoute = '/setting';
const expansionRoute = '/expansion';
const newsRoute = '/news';
const newsDetailRoute = '/newsDetail';
const googleSigninDemoRoute = '/googleSignin';
const dashboardRoute = '/dashboard';
const categoryRoute = '/category';
const childCategoryRoute = '/childCategory';
const subCategoryRoute = '/subCategory';
const homeRoute = '/home';

// Controllers
const ONBOARD_CONTROLLER = '_onboard_controller';
const LOGIN_CONTROLLER = '_login_controller';
const LOCALE_CONTROLLER = '_locale_controller';
const SPLASH_CONTROLLER = '_splash_controller';
const SETTINGS_CONTROLLER = '_settings_controller';
const OTP_CONTROLLER = '_otp_controller';
const PASS_CONTROLLER = '_pass_controller';
const SHOPPING_CONTROLLER = '_shopping_controller';
const CART_CONTROLLER = '_cart_controller';

const DASHBOARD_CONTROLLER = '_dashboard_controller';
const HOME_CONTROLLER = '_home_controller';
const SEARCH_CONTROLLER = '_search_controller';
const PRODUCT_CONTROLLER = '_product_controller';
const FILTER_CONTROLLER = '_filter_controller';
const PRODUCT_DETAIL_CONTROLLER = '_product_detail';
const BUCKET_CONTROLLER = '_bucket_controller';
const CHECKOUT_CONTROLLER = '_checkout_controller';
const ORDER_CONTROLLER = '_order_controller';
const COUPON_CONTROLLER = '_coupon_controller';
const ADDRESS_CONTROLLER = '_address_controller';
const BANNER_CONTROLLER = '_banner_controller';
const NETWORK_CONTROLLER = '_network_controller';
const CATEGORY_CONTROLLER = '_category_controller';
const C_CATEGORY_CONTROLLER = '_s_category_controller';
const S_CATEGORY_CONTROLLER = '_s_category_controller';
const SOCKET_CONTROLLER = 'socket_controller';
const VIDEO_CONTROLLER = 'video_controller';
const PROFILE_CONTROLLER = 'profile_controller';
const RATING_CONTROLLER = 'rating_controller';

// Locales
const hiLocale = Locale('hi', 'IN');
const ukLocale = Locale('en', 'US');
const arLocale = Locale('ar', 'AE');
// const localeList = <Locale>[ukLocale, arLocale];

// Fonts
const FONT_IBM_PLEX_SANS_ARABIC = 'IBMPlexSansArabic';

// Storage
const BOX_APP = 'bumaco_storage';
final GetStorage getStorage = GetStorage(BOX_APP);
const BOX_APP_OPEN_COUNT = 'app_open_count'; //int
// .listenKey(BOX_APP_OPEN_COUNT, (value) {
//   print('BOX_APP_OPEN_COUNT=>$value');
// })
// .listen(() {
//   print('---->sounds-value-changed<------');
// });

// GetStorage _storage = GetStorage(BOX_APP);
//     or
// final _storage = GetStorage();
// _storage.write(key, value); //write
// _storage.read(key); //Read
// _storage.remove(Key); //particular or single key remove
// _storage.erase(); //container remove.

// //Easy Change Theme
// Get.changeTheme(ThemeData.Dark);

// //Easy Validator:
// GetUtils.isEmail('abc@gmail.com') ? validate() :errorMessage();

const BOX_FCM_TOKEN = 'fcm_token'; //string
const BOX_COUNTRY = 'country'; //string
const BOX_CURRENCY = 'currency'; //string
const BOX_CURRENCY_SYMBOL = 'currency_symbol'; //string
const BOX_COUNTRY_CODE = 'country_code'; //string
const BOX_CUSTOMER_ID = 'customer_id'; //string
const BOX_NAME = 'name'; //string
const BOX_MOBILE = 'mobile'; //string
const BOX_EMAIL = 'email'; //string
const BOX_GENDER = 'gender'; //string
const BOX_DOB = 'dob'; //string
const BOX_PASSWORD = 'password'; //string
const BOX_PROFILE_PHOTO = 'photo'; //string
const BOX_GOOGLE_ID = 'google_id'; //string
const BOX_IS_LOGGEDIN = 'is_loggedin'; //bool
const BOX_TEMP_LOGGEDIN = 'temp_loggedin'; //bool
const BOX_IS_DARK = 'is_dark'; //bool
const BOX_IS_NOTIFICATION = 'is_notification'; //bool
const BOX_GATE_SELECTED = 'gate_selected'; //string
const BOX_GATE_SELECTED_ID = 'gate_selected_id'; //string
const BOX_BADGE_ACCOUNT1 = 'badge_account';

putStorageValue(key, value) {
  final box = GetStorage(BOX_APP);
  final _result = box.write(key, value);
  print(_result);
}

getStorageStringValue(key) {
  final box = GetStorage(BOX_APP);
  final _value = box.read(key);
  return _value ?? '';
}

getStorageBoolValue(key) {
  final box = GetStorage(BOX_APP);
  final _value = box.read(key);
  return _value ?? false;
}

getStorageIntValue(key) {
  final box = GetStorage(BOX_APP);
  final _value = box.read(key);
  return _value ?? 0;
}

getStorageDoubleValue(key) {
  final box = GetStorage(BOX_APP);
  final _value = box.read(key);
  return _value ?? 0.0;
}

//Database
const DB_NAME = 'bumaco_database.db';
const DB_VERSION = 1;

class ApiConstants {
  static const apiKey = '60b65cc18763454eaf48d48406105496';
  static final baseImageUrl = AppEnvironment.baseUrl + 'uploads/';
  static final baseUrlApi = AppEnvironment.baseUrl + 'api/';
  static const categoryApi = 'categoryapi/category';
  static const childCategoryApi = 'categoryapi/childcategory';
  static const subCategoryApi = 'categoryapi/subcategory';
  static const productApi = 'productapi/productdata/'; //get
  static const newProductApi = 'productapi/productv/'; //post
  static const couponApi = 'productapi/couponcode/'; //post
  static const orderApi = 'productapi/productorder/'; //post

  static const bannerSliderApi = 'bannerapi/homeslider/';
  static const bannerApi = 'bannerapi/position';
  static const productApiHome = 'productapi/homeproduct';
  static const productApiAll = 'productapi/product';
  static const productApiSearchFilter = 'productapi/searchproduct/';
  static const loginApi = 'auth/login';
  static const userloginApi = 'auth/userlogin';
  static const profileApi = 'auth/profile';

  static const allUserApi = 'userapi/user';
  // static const productApi =
  //     'https://makeup-api.herokuapp.com/api/v1/products.json';
  // static const productApi =
  //     'http://makeup-api.herokuapp.com/api/v1/products.json?brand=covergirl&product_type=lipstick';
  static const productMakeupApi =
      'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';
  static const newsApi =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=60b65cc18763454eaf48d48406105496';
// https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=60b65cc18763454eaf48d48406105496
  static const dummyApi = '';

  static const userApi = 'userapi/user/';
  static final userByIdApi = AppEnvironment.baseUrl + 'userapi/user?id=1';
  static const appTokenApi = 'productapi/apptoken/';
}

mBanner({context, title, icon, actions}) =>
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        backgroundColor: Colors.yellow.shade100,
        leading: Icon(icon ?? Icons.info_outline_rounded),
        content: Text(title),
        padding: EdgeInsets.all(15),
        contentTextStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
        actions: actions ??
            [
              TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                  },
                  child: Text('OK'))
            ],
      ),
    );

bumacoSnackbar(title, message) => Get.snackbar(
      title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade900,
      icon: Icon(Icons.info_outline_rounded, color: kWhiteColor),
      // backgroundGradient: LinearGradient(colors: [Colors.red, Colors.green]),
      colorText: kWhiteColor,
      borderColor: kWhiteColor, //use borderColor,radius,width simulteneously
      borderRadius: 4,
      borderWidth: 1,
      barBlur: 0,
      overlayBlur: 1.0,
      overlayColor: kTransparentColor,
      // boxShadows: [
      //   BoxShadow(
      //     color: Colors.yellow,
      //     offset: Offset(30, 50),
      //     spreadRadius: 20,
      //     blurRadius: 8,
      //   )
      // ],
      // mainButton: TextButton(
      //   child: 'Ok'.text.make(),
      //   onPressed: () {},
      // ),
      onTap: (v) {
        print('dismiss this');
      },
      snackbarStatus: (status) => print(status),
      snackStyle: SnackStyle.FLOATING,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      margin: EdgeInsets.all(15),
      duration: Duration(milliseconds: 2100),
      animationDuration: 400.milliseconds,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      // reverseAnimationCurve: Curves.easeInBack,
      // showProgressIndicator: true,
      // progressIndicatorBackgroundColor: Colors.deepOrange,
      // progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      // userInputForm: Form(
      //   child: Row(children: [
      //     Expanded(
      //       child: VxTextField(),
      //     )
      //   ]),
      // ),
    );
noInternetSnackbar() => bumacoSnackbar(
    'alert'.tr, 'Please check internet connection and try again!');
errorMessageSnackbar() =>
    bumacoSnackbar('alert'.tr, 'Something went wrong, please try later!');
bumacoDefaultDialog(msg) => Get.defaultDialog(
      title: 'alert'.tr,
      content: Text(msg),
    );
bumacoBottomsheet(title, message, height) => Get.bottomSheet(Container(
      height: height,
      color: kBlackColor.withOpacity(0.3),
      child: Column(children: [
        SizedBox(height: 20),
        ListTile(title: Text(title)),
        ListTile(title: Text(message)),
        MaterialButton(
          onPressed: () => Get.back(),
          child: 'OK'.text.xl.make().p12(),
        )
      ]),
    ));
bumacoDialog(context, title, message, action) => showDialog<bool>(
    context: context,
    builder: (c) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: action ??
              [
                MaterialButton(
                    child: Text('yes'.tr),
                    onPressed: () => {
                          Navigator.pop(c, true),
                          bumacoSnackbar(
                              'alert'.tr, 'Your request is submitted.')
                        }),
                MaterialButton(
                  child: Text('no'.tr),
                  onPressed: () => Navigator.pop(c, false),
                ),
              ],
        ));
bumacoToast(context, msg) => VxToast.show(
      context,
      msg: msg,
      position: VxToastPosition.bottom,
      bgColor: kWhiteColor,
      textColor: kBlackColor,
    );

getRandomString(int length) {
  //todo: not working
  final _rnd = Random();
  String.fromCharCodes(Iterable.generate(length, (_) {
    return _charsLower.codeUnitAt(_rnd.nextInt(_charsLower.length));
  }));
}

getRandomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  // .withOpacity(0.3);
  // [Random().nextInt(9) * 100];
}

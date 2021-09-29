// Colors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const kPrimaryColor = Colors.pink; //Color(0xFFFF7643);
const kPrimaryColorDark = Colors.blueAccent;
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
const kBodyText1 = Colors.black;
const kBodyText2 = Colors.black54;
const kHeadline = Colors.black;
const kWhiteColor = Colors.white;
const kTransparentColor = Colors.transparent;
const kScafoldBGColor = Colors.transparent;
const kScafoldDarkBGColor = Colors.teal;

// String
const appName = 'Bumaco';
const appTitle = 'Bumaco';
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kPhoneNumber10digit = "Please Enter 10 digit mobile number";
const String kInvalidChar = "Invalid character";
const String kPasswordError = "Invalid password";
const String kValidNumber = "Invalid number";
const String kOtpNullError = "Please Enter your phone number";
const String kValidEmail = "Invalid email id";
const String kOtp4digit = "Please Enter correct otp";

// Patterns
final RegExp numericRegExp = RegExp(r'\d');
final RegExp a2zRegExp = RegExp('[a-zA-Z]');
final RegExp patternMobile = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
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
const loginRoute = '/login';
const authRoute = '/auth';
const landingRoute = '/landing';
const otpRoute = '/otp';
const profileRoute = '/profile';
const shoppingRoute = '/shopping';
const staggerdImgRoute = '/staggerdImg';
const allProductRoute = '/allProduct';
const catalogRoute = '/catalog';
const productDetailRoute = '/product_detail';
const wishlistRoute = '/wishlist';
const offerRoute = '/offer';
const ratingRoute = '/rating';
const shrinkRoute = '/shrink';
const settingRoute = '/setting';
const newsRoute = '/news';
const searchNewsRoute = '/searchNews';
const newsDetailRoute = '/newsDetail';
const googleSigninDemoRoute = '/googleSignin';
const dashboardRoute = '/dashboard';
const categoryRoute = '/category';
const childCategoryRoute = '/childCategory';
const subCategoryRoute = '/subCategory';


// Controllers
const ONBOARD_CONTROLLER = '_onboard_controller';
const LOGIN_CONTROLLER = '_login_controller';
const LOCALE_CONTROLLER = '_locale_controller';
const SPLASH_CONTROLLER = '_splash_controller';
const SETTINGS_CONTROLLER = '_settings_controller';
const OTP_CONTROLLER = '_otp_controller';
const SHOPPING_CONTROLLER = '_shopping_controller';
const CART_CONTROLLER = '_cart_controller';

// Locales
const hiLocale = Locale('hi', 'IN');
const usLocale = Locale('en', 'US');
const arLocale = Locale('ar', 'AE');
const localeList = <Locale>[usLocale, arLocale];

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

const BOX_COUNTRY = 'country'; //string
const BOX_MOBILE_EMAIL = 'mobile_email'; //string
const BOX_IS_LOGGEDIN = 'is_loggedin'; //bool
const BOX_IS_DARK = 'is_dark'; //bool
const BOX_IS_NOTIFICATION = 'is_notification'; //bool

//Database
const DB_NAME = 'bumaco_db';
const DB_VERSION = 1;

class ApiConstants {
  static const apiKey = '60b65cc18763454eaf48d48406105496';
  static const baseUrl = 'https://brandhype.co.in/bumaco/';
  static const baseImageUrl = baseUrl + 'uploads/';
  static const baseUrlApi = baseUrl + 'api/';
  static const categoryApi = 'categoryapi/category';
  static const childCategoryApi = 'categoryapi/childcategory';
  static const subCategoryApi = 'categoryapi/subcategory';

  static const userApi = 'userapi/user/';
  static const userByIdApi = baseUrlApi + 'userapi/user?id=1';
}

bumacoSnackbar(title, message) => Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade900,
      icon: Icon(Icons.face_rounded, color: kWhiteColor),
      colorText: kWhiteColor,
      borderColor: kWhiteColor,
      borderRadius: 4,
      borderWidth: 1,
      barBlur: 0,
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.all(15),
      duration: Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.easeOutBack,
    );
showSnackbar(title, message) => Get.showSnackbar(
      GetBar(
        title: title,
        message: message,
        icon: Icon(Icons.face, color: kWhiteColor),
        snackPosition: SnackPosition.TOP,
        borderColor: kWhiteColor,
        borderRadius: 4,
        borderWidth: 1,
        barBlur: 0,
        isDismissible: true,
      ),
    );
bumacoDefaultDialog(msg) => Get.defaultDialog(
      title: "Alert",
      content: Text(msg),
    );
bumacoBottomsheet(msg) => Get.bottomSheet(Container(
      height: 250,
      color: kWhiteColor,
      child: Column(children: [
        ListTile(title: Text(msg)),
        ListTile(title: Text(msg)),
      ]),
    ));

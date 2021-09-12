// Colors
import 'package:flutter/material.dart';

const lightBackgroundColor = Color(0xff374ABE);
const gradientColorBlue1 = Color(0xff64B6FF);
const gradientColorBlue2 = Color(0xff64B6FF);
const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
// const kSecondaryColor = Color(0xFF979797);
// const kTextColor = Color(0xFF757575);

const kTextColor = Colors.blue;
const kSecondaryColor = Colors.blueGrey;

// String
const appTitle = 'Magnetic';
const appName = 'Magnetic Admin';
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
final RegExp patternEmail =  
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
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
const String initialRoute = '/';
const String loginRoute = '/login';
const String listUserRoute = '/user';
const String addUserRoute = '/add';
const String counterRoute = '/counter';

class AppConstants {
  // static const baseUrl = 'http://10.0.2.2:4000/';
  // static const baseUrl = 'http://192.168.225.77:4000/';
  static const baseUrl = 'http://192.168.43.123:4000/';
  // static const baseUrl = 'http://192.168.1.101:4000/';

  static const userLogin = baseUrl + 'user/login/';
  static const userList = baseUrl + 'user/list/';
  static const userAdd = baseUrl + 'user/add/';
  static const userUpdate = baseUrl + 'user/update/';
  static const userFind = baseUrl + 'user/find/';
}

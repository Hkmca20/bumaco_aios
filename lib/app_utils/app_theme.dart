import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/dummy/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

ThemeData setTheme(context) {
  final _settingsController = SettingsController.to;
  return ThemeData(
    // fontFamily: lang == 'ar' ? 'FrutigerLTArabic' : 'ProximaNova',
    // textTheme: Theme.of(context).textTheme.apply(
    //     fontFamily: lang == 'ar' ? 'FrutigerLTArabic' : 'ProximaNova',
    //     fontSizeDelta: lang == 'ar' ? -5.0 : 0.0),
    fontFamily: FONT_IBM_PLEX_SANS_ARABIC,
    primarySwatch: Colors.cyan, 
    primaryColor: kPrimaryColor,
    primaryColorDark: kPrimaryColorDark,

    // scaffoldBackgroundColor: Colors.grey[850], //Colors.teal//(0xFFF3F5F7),
    brightness: _settingsController.brightness,

    // cardColor: Colors.white,
    // canvasColor: creamColor,
    // buttonColor: darkBluishColor,
    accentColor: kAccentColor,

    appBarTheme: appBarTheme(),
    // textTheme: GoogleFonts.latoTextTheme(),
    // textTheme: Theme.of(context).textTheme.apply(
    //       fontFamily: 'IBMPlexSansArabic',
    //     ),
    // textTheme: textTheme(),
    // buttonTheme: buttonTheme(context),
    elevatedButtonTheme: elevatedButtonTheme(),
    // inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData setDarkTheme(context) {
  final _settingsController = SettingsController.to;
  return ThemeData(
    // fontFamily: lang == 'ar' ? 'FrutigerLTArabic' : 'ProximaNova',
    // textTheme: Theme.of(context).textTheme.apply(
    //     fontFamily: lang == 'ar' ? 'FrutigerLTArabic' : 'ProximaNova',
    //     fontSizeDelta: lang == 'ar' ? -5.0 : 0.0),
    fontFamily: FONT_IBM_PLEX_SANS_ARABIC,
    // primarySwatch: Colors.blue, //cyan
    primaryColor: kPrimaryColor,
    primaryColorDark: kPrimaryColorDark,
    // scaffoldBackgroundColor: Colors.grey[850], //Colors.teal//(0xFFF3F5F7),
    brightness: _settingsController.brightness,

    // cardColor: Colors.black,
    // canvasColor: darkCreamColor,
    // buttonColor: lightBluishColor,
    accentColor: kAccentColor,

    appBarTheme: appBarTheme(),
    // textTheme: GoogleFonts.latoTextTheme(),
    // textTheme: Theme.of(context).textTheme.apply(
    //       fontFamily: 'IBMPlexSansArabic',
    //     ),
    // textTheme: textTheme(),
    // buttonTheme: buttonTheme(context),
    elevatedButtonTheme: elevatedButtonTheme(),
    // inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

Color creamColor = Color(0xfff5f5f5);
Color darkCreamColor = Vx.gray900;
Color darkBluishColor = Color(0xff403b58);
Color lightBluishColor = Vx.indigo500;

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor, fontSize: 20),
    bodyText2: TextStyle(color: kTextColor),
    button: TextStyle(color: kTextColor),
  );
}

ButtonThemeData buttonTheme(context) {
  return ButtonThemeData(
    textTheme: ButtonTextTheme.accent,
    colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: kPrimaryColor,
          // secondary will be the textColor, when the textTheme is set to accent
          secondary: Colors.black,
        ),
  );
}

ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(color: kPrimaryColor, width: 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      onPrimary: Colors.white,
      primary: kPrimaryColor,
      shadowColor: kPrimaryColor,
      onSurface: Colors.white,
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: kPrimaryColor,
    elevation: 0.1,
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: Colors.white),
    foregroundColor: Colors.white,
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}

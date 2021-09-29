import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

ThemeData setTheme(context) {
  // final ThemeData theme = Theme.of(context);
  // final _settingsController = SettingsController.to;
  return ThemeData(
    // fontFamily: lang == 'ar' ? 'FrutigerLTArabic' : 'ProximaNova',
    // textTheme: Theme.of(context).textTheme.apply(
    //     fontFamily: lang == 'ar' ? 'FrutigerLTArabic' : 'ProximaNova',
    //     fontSizeDelta: lang == 'ar' ? -5.0 : 0.0),
    fontFamily: FONT_IBM_PLEX_SANS_ARABIC,
    primarySwatch: Colors.cyan,
    primaryColor: kPrimaryColor,
    primaryColorDark: kPrimaryColorDark,
    dividerColor: Colors.black12,
    brightness: Brightness.light,

    // scaffoldBackgroundColor: Colors.grey[850], //Colors.teal//(0xFFF3F5F7),
    // cardColor: Colors.white,
    // canvasColor: creamColor,
    // buttonColor: darkBluishColor,
    // colorScheme: theme.colorScheme.copyWith(secondary: kAccentColor),

    appBarTheme: appBarTheme(),
    textTheme: GoogleFonts.nunitoTextTheme(),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: Colors.black,
      textTheme: CupertinoTextThemeData(
        textStyle: GoogleFonts.nunito(),
      ),
    ),
    // buttonTheme: buttonTheme(context),
    elevatedButtonTheme: elevatedButtonTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

Color creamColor = Color(0xfff5f5f5);
Color darkCreamColor = Vx.gray900;
Color darkBluishColor = Color(0xff403b58);
Color lightBluishColor = Vx.indigo500;

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: BorderSide(color: Colors.white),
    gapPadding: 8,
  );
  UnderlineInputBorder underlineInputBorder = UnderlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: BorderSide(width: 0.7, color: Colors.white),
  );
  TextStyle kTextstyle =
      TextStyle(decorationColor: kWhiteColor, color: kWhiteColor);
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 18),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    focusedErrorBorder: underlineInputBorder,
    disabledBorder: underlineInputBorder,
    border: outlineInputBorder,
    floatingLabelStyle: kTextstyle,
    hintStyle: kTextstyle,
    labelStyle: kTextstyle,
    helperStyle: kTextstyle,
    hoverColor: kWhiteColor,
    focusColor: kWhiteColor,
    fillColor: kWhiteColor,
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
      textStyle: TextStyle(fontSize: 22),
      shape: RoundedRectangleBorder(
        // gradient: LinearGradient(
        //     // colors: [Colors.red, Colors.blue],
        //     colors: [gradientColorBlue1, gradientColorBlue2],
        //     begin: Alignment.centerLeft,
        //     end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: kPrimaryColor, width: 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      elevation: 4,
      onPrimary: Colors.white,
      primary: kPrimaryColor,
      shadowColor: kPrimaryColor,
      onSurface: Colors.white,
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    elevation: 8,
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Colors.white24,
    foregroundColor: Colors.white,
    toolbarHeight: 56,
    actionsIconTheme: IconThemeData(color: Colors.white),
  );
}

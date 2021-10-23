import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData setDarkTheme(context) {
  // final ThemeData theme = Theme.of(context);
  final base = ThemeData.dark();
  return base.copyWith(
    primaryColorDark: kPrimaryColorDark,
    brightness: Brightness.dark,

    appBarTheme: _appBarThemeDark(),
    // iconTheme: _customIconTheme(base.iconTheme),
    // primaryIconTheme: _customIconTheme(base.iconTheme),
    primaryTextTheme: GoogleFonts.nunitoTextTheme(base.primaryTextTheme),
    textTheme: GoogleFonts.nunitoTextTheme(base.textTheme),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: Colors.black,
      textTheme: CupertinoTextThemeData(
        textStyle: GoogleFonts.nunito(),
      ),
    ),
    elevatedButtonTheme: elevatedButtonThemeDark(),
    inputDecorationTheme: inputDecorationThemeDark(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ElevatedButtonThemeData elevatedButtonThemeDark() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 16),
      shape: RoundedRectangleBorder(
        // gradient: LinearGradient(
        //     // colors: [Colors.red, Colors.blue],
        //     colors: [gradientColorBlue1, gradientColorBlue2],
        //     begin: Alignment.centerLeft,
        //     end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: kPrimaryColor, width: 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 4,
      onPrimary: Colors.white,
      primary: kPrimaryColor,
      shadowColor: kPrimaryColor,
      onSurface: Colors.white,
    ),
  );
}

InputDecorationTheme inputDecorationThemeDark() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: kPrimaryColor),
    gapPadding: 8,
  );
  UnderlineInputBorder underlineInputBorder = UnderlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(width: 2.0),
  );
  TextStyle kTextstyle = TextStyle(
    decorationColor: kPrimaryColor,
    color: kPrimaryColor,
  );
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
    // hoverColor: kPrimaryColor,
    // focusColor: kPrimaryColor,
    // fillColor: kPrimaryColor,
  );
}

AppBarTheme _appBarThemeDark() {
  return AppBarTheme(
    elevation: 2,
    toolbarHeight: 56,
    iconTheme: IconThemeData(color: kPrimaryColor),
    actionsIconTheme: IconThemeData(color: kPrimaryColor),
  );
}

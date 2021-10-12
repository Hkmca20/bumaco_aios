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
    // elevatedButtonTheme: elevatedButtonTheme(),
    // inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
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

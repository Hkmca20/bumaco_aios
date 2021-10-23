import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

ThemeData setTheme(context) {
  // final ThemeData theme = Theme.of(context);
  // final _settingsController = SettingsController.to;
  final base = ThemeData.light();
  return base.copyWith(
    // fontFamily: lang == 'ar' ? 'FrutigerLTArabic' : 'ProximaNova',
    // textTheme: Theme.of(context).textTheme.apply(
    //     fontFamily: lang == 'ar' ? 'FrutigerLTArabic' : 'ProximaNova',
    //     fontSizeDelta: lang == 'ar' ? -5.0 : 0.0),

    // fontFamily: FONT_IBM_PLEX_SANS_ARABIC,
    // primarySwatch: Colors.cyan,

    colorScheme: _shrineColorScheme,
    toggleableActiveColor: shrinePink400,
    // primaryColor: kPrimaryColor,
    primaryColor: shrinePink100,
    primaryColorLight: shrinePink100,
    primaryColorDark: kPrimaryColorDark,
    // scaffoldBackgroundColor: shrineBackgroundWhite,
    cardColor: shrineBackgroundWhite,
    errorColor: shrineErrorRed,
    dividerColor: Colors.black12,
    brightness: Brightness.light,

    // scaffoldBackgroundColor: Colors.grey[850], //Colors.teal//(0xFFF3F5F7),
    // cardColor: Colors.white,
    // canvasColor: creamColor,
    // buttonColor: darkBluishColor,
    // colorScheme: theme.colorScheme.copyWith(secondary: kAccentColor),

    appBarTheme: _appBarThemeLight(),
    iconTheme: _customIconTheme(base.iconTheme),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: Colors.black,
      textTheme: CupertinoTextThemeData(
        textStyle: GoogleFonts.nunito(),
      ),
    ),
    buttonTheme: _customButtonTheme(base.buttonTheme),
    elevatedButtonTheme: elevatedButtonTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

Color creamColor = Color(0xfff5f5f5);
Color darkCreamColor = Vx.gray900;
Color darkBluishColor = Color(0xff403b58);
Color lightBluishColor = Vx.indigo500;

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: kPrimaryColor),
    gapPadding: 8,
  );
  UnderlineInputBorder underlineInputBorder = UnderlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(width: 2.0),
  );
  TextStyle kTextstyle =
      TextStyle(decorationColor: kPrimaryColor, color: kPrimaryColor);
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

ButtonThemeData _customButtonTheme(ButtonThemeData data) {
  return data.copyWith(
    textTheme: ButtonTextTheme.normal,
    colorScheme: _shrineColorScheme.copyWith(primary: shrinePink400),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: shrineBrown900);
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return GoogleFonts.nunitoTextTheme(base);
  // base
  //     .copyWith(
  //       caption: base.caption!.copyWith(
  //         fontWeight: FontWeight.w400,
  //         fontSize: 14,
  //         letterSpacing: defaultLetterSpacing,
  //       ),
  //       button: base.button!.copyWith(
  //         fontWeight: FontWeight.w500,
  //         fontSize: 14,
  //         letterSpacing: defaultLetterSpacing,
  //       ),
  //     )
  //     .apply(
  //       fontFamily: FONT_IBM_PLEX_SANS_ARABIC,
  //       displayColor: shrineBrown900,
  //       bodyColor: shrineBrown900,
  //     );
}

ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 16),
      shape: RoundedRectangleBorder(
        // gradient: LinearGradient(
        //     // colors: [Colors.red, Colors.blue],
        //     colors: [gradientColorBlue1, gradientColorBlue2],
        //     begin: Alignment.centerLeft,
        //     end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(color: kPrimaryColor, width: 0),
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

AppBarTheme _appBarThemeLight() {
  return AppBarTheme(
    elevation: 2,
    iconTheme: IconThemeData(color: kPrimaryColor),
    actionsIconTheme: IconThemeData(color: kPrimaryColor),
    toolbarHeight: 56,
  );
}

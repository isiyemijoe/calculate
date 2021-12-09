import 'package:flutter/material.dart';

class AppTheme {
  static final Color fadeGrey = Color(0xffF3F4F6);
  static final Color orange = Color(0xffE39601);
  static final Color pjGrey = Color(0xffF3F4F6);
  static final Color e4Grey = Color(0xffE4E4E4);
  static final Color chGrey = Color(0xffF3F4F6);
  static final Color chatboxGrey = Color(0xffE5E5E5);
  static final Color btnRed = Color(0xffE96668);
  static final Color btnGreen = Color(0xff35D5B7);
  static final Color darkIcon = Color(0xff3D4149);
  static final Color btnColor = Color(0xff272B33);
  static final Color btnDis = Color(0xffE2E2E2);
  static final Color lightDark = Color(0xffE2E2E2);

  static final ThemeData iwriteLight = ThemeData(
    primarySwatch: MaterialColor(4279204800, {
      50: Color(0xffe7f5fd),
      100: Color(0xffd0eafb),
      200: Color(0xffa0d6f8),
      300: Color(0xff71c1f4),
      400: Color(0xff42acf0),
      500: Color(0xff1298ed),
      600: Color(0xff0f79bd),
      700: Color(0xff0b5b8e),
      800: Color(0xff034080).withOpacity(0.8),
      900: Color(0xff034080)
    }),
    brightness: Brightness.light,
    primaryColor: Color(0xff034080),
    fontFamily: "Metropolis",
    primaryColorBrightness: Brightness.light,
    primaryColorLight: Color(0xff095A99),
    primaryColorDark: Color(0xff09BCBF),
    accentColor: Color(0xff289CF4),
    accentColorBrightness: Brightness.light,
    canvasColor: Color(0xfffafafa),
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarColor: Color(0xffF9F9F9),
    cardColor: Color(0xffffffff),
    dividerColor: Color(0x1f000000),
    highlightColor: Color(0x66bcbcbc),
    splashColor: Color(0x66c8c8c8),
    selectedRowColor: Color(0xfff5f5f5),
    unselectedWidgetColor: Color(0x8a000000),
    disabledColor: Color(0x61000000),
    buttonColor: Color(0xffF2F2F2),
    toggleableActiveColor: Color(0xff0f79bd),
    secondaryHeaderColor: Color(0xffe7f5fd),
    textSelectionColor: Color(0xffa0d6f8),
    cursorColor: Color(0xff4285f4),
    textSelectionHandleColor: Color(0xff71c1f4),
    backgroundColor: Color(0xffa0d6f8),
    dialogBackgroundColor: Color(0xffffffff),
    indicatorColor: Color(0xff1298ed),
    hintColor: Color(0x8a000000),
    errorColor: Color(0xffd32f2f),
    appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        elevation: 0.0,
        color: Colors.white,
//        iconTheme: IconThemeData(
//            color: Colors.black
//        ),
        textTheme: TextTheme(
            headline6: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0))),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      minWidth: 88,
      height: 36,
      padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xff7054FF),
          width: 0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      alignedDropdown: false,
      buttonColor: Color(0xff7054FF),
      disabledColor: Color(0x61000000),
      highlightColor: Color(0x00000000),
      splashColor: Color(0x1fffffff),
      focusColor: Color(0x1f000000),
      hoverColor: Color(0x0a000000),
      colorScheme: ColorScheme(
        primary: Color(0xff034080),
        primaryVariant: Color(0xff095A99),
        secondary: Color(0xff289CF4),
        secondaryVariant: Color(0xff09BCBF),
        surface: Color(0xff7054FF),
        background: Color(0xffa0d6f8),
        error: Color(0xffd32f2f),
        onPrimary: Color(0xff7054FF),
        onSecondary: Color(0xff7054FF),
        onSurface: Color(0xff000000),
        onBackground: Color(0xff7054FF),
        onError: Color(0xffffffff),
        brightness: Brightness.light,
      ),
    ),
  );

  static final ThemeData iwriteDark = ThemeData(
    primarySwatch: MaterialColor(4279204800, {
      50: Color(0xffe7f5fd),
      100: Color(0xffd0eafb),
      200: Color(0xffa0d6f8),
      300: Color(0xff71c1f4),
      400: Color(0xff42acf0),
      500: Color(0xff1298ed),
      600: Color(0xff0f79bd),
      700: Color(0xff0b5b8e),
      800: Color(0xff034080).withOpacity(0.8),
      900: Color(0xff034080)
    }),
    brightness: Brightness.dark,
    fontFamily: "Metropolis",
    primaryColor: Color(0xff034080),
    primaryColorBrightness: Brightness.dark,
    primaryColorLight: Color(0xff095A99),
    primaryColorDark: Color(0xff09BCBF),
    accentColor: Color(0xff289CF4),
    accentColorBrightness: Brightness.dark,
    canvasColor: Color(0xff0E121A),
    scaffoldBackgroundColor: Color(0xff22252D),
    bottomAppBarColor: Color(0xff292D36),
    cardColor: Color(0xffffffff),
    dividerColor: Color(0x1f000000),
    highlightColor: Color(0x66bcbcbc),
    splashColor: Color(0x66c8c8c8),
    selectedRowColor: Color(0xfff5f5f5),
    unselectedWidgetColor: Color(0x8a000000),
    disabledColor: Color(0x61000000),
    buttonColor: Color(0xff272B33),
    toggleableActiveColor: Color(0xff1c212d),
    secondaryHeaderColor: Color(0xffe7f5fd),
    textSelectionColor: Color(0xffa0d6f8),
    cursorColor: Color(0xff4285f4),
    textSelectionHandleColor: Color(0xff71c1f4),
    backgroundColor: Color(0xffa0d6f8),
    dialogBackgroundColor: Color(0xffffffff),
  );
}

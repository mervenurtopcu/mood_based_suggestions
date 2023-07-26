import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mood_based_suggestions/product/constants/color_constants.dart';

@immutable
class DarkTheme {
  const DarkTheme._();

  static final ThemeData darkTheme = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    scaffoldBackgroundColor: ColorConstants.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstants.transparent,
      foregroundColor: ColorConstants.white,
      titleTextStyle: TextStyle(
        color: ColorConstants.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorConstants.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorConstants.black,
      selectedItemColor: ColorConstants.white,
      unselectedItemColor: ColorConstants.bottomNavBarUnselectedItem,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(ColorConstants.loginTextFieldFocus),
      trackColor: MaterialStateProperty.all<Color>(ColorConstants.loginSubtitle),
      overlayColor: MaterialStateProperty.all<Color>(ColorConstants.loginTextFieldFocus)
    ),
    drawerTheme: const DrawerThemeData(
      endShape: StadiumBorder(),
      backgroundColor: ColorConstants.darkGray,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),

    ),
  );
}

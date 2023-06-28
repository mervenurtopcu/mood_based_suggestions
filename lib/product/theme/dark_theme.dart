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
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorConstants.black,
      selectedItemColor: ColorConstants.white,
      unselectedItemColor: ColorConstants.bottomNavBarUnselectedItem,
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

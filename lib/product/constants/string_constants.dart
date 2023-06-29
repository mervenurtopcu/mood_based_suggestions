import 'package:flutter/material.dart';

@immutable
class StringConstants {
  const StringConstants._();

  // main.dart
 static const String materialAppTitle = 'MoodyWise';

 //drawer
  static const String drawerHeader = 'MoodyWise';
  static const String drawerSwitchButton = ' Dark Mode';
  static const String drawerListTile = 'Profile';

  //bottom navigation bar menu items
  static const String bottomNavBarHome = 'Home';
  static const String bottomNavBarCategory = 'Category';
  static const String bottomNavBarFavorites = 'Favorites';
  static const String bottomNavBarProfile = 'Profile';

 //LoginScreen
  static const String loginScreenTitle = 'Login';
  static const String loginScreenSubtitle = 'Login to your existant account of MoodyWise';
  static const String loginScreenEmail = 'EMAIL';
  static const String loginScreenPassword = 'PASSWORD';
  static const String loginScreenForgetPassword = 'Forget Password?';
  static const String loginScreenLoginButton = 'LOGIN';
  static const String loginScreenSignUpText = 'Don\'t have an account?';
  static const String loginScreenSignUpTextButton = 'Sign Up';

 //Register Screen
  static const String registerScreenTitle = 'Let\'s Get Started!';
  static const String registerScreenSubtitle = 'Create an account to MoodyWise to get all features';
  static const String registerScreenName = 'NAME';
  static const String registerScreenEmail = 'EMAIL';
  static const String registerScreenPassword = 'PASSWORD';
  static const String registerScreenConfirmPassword = 'CONFIRM PASSWORD';
  static const String registerScreenSignUpButton = 'SIGN UP';
  static const String registerScreenLoginText = 'Already have an account?';
  static const String registerScreenLoginTextButton = 'Login';
}
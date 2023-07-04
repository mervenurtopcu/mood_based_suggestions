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
  static const String loginScreenForgetPassword = 'Forgot Password?';
  static const String loginScreenLoginButton = 'LOGIN';
  static const String loginScreenSignUpText = 'Don\'t have an account?';
  static const String loginScreenSignUpTextButton = 'Sign Up';

 //Register Screen
  static const String registerScreenTitle = 'Let\'s Get Started!';
  static const String registerScreenSubtitle = 'Create an account to MoodyWise to get all features';
  static const String registerScreenEmail = 'EMAIL';
  static const String registerScreenPassword = 'PASSWORD';
  static const String registerScreenSignUpButton = 'SIGN UP';
  static const String registerScreenLoginText = 'Already have an account?';
  static const String registerScreenLoginTextButton = 'Login';
  static const String registerScreenValidatorEmail = 'Enter a valid email';
  static const String registerScreenValidatorPassword= 'Password must be at least 6 characters long';

  //Forgot Password Screen
  static const String forgotPasswordScreenTitle = 'Reset\nPassword';
  static const String forgotPasswordScreenSubtitle = 'Please enter your email address to request a password reset.';
  static const String forgotPasswordScreenButton = 'Reset Password';
  static const String utilsSnackBarText = 'Password reset link has been sent to your email';

  //Email Verification Screen
  static const String emailVerificationScreenTitle = 'Verify Email';
  static const String emailVerificationScreenSubtitle =  'An email has been sent to your email address please verify';
 static const String emailResentEmail = 'Resent Email';
 static const String emailVerificationCancelButton = 'Cancel';

 //Error Messages
  static const String errorLoginScreen = 'Something went wrong';
}
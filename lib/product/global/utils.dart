import 'package:flutter/material.dart';
import 'package:mood_based_suggestions/product/constants/color_constants.dart';
class Utils {
  Utils._();

  static final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
   if(text == null) return;
   final snackBar = SnackBar(
     content: Text(text),
     backgroundColor: ColorConstants.red,
   );
   messengerKey.currentState!
   ..removeCurrentSnackBar()
   ..showSnackBar(snackBar);
  }
}
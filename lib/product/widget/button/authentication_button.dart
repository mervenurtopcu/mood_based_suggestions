import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mood_based_suggestions/product/constants/color_constants.dart';

class AuthButton extends ConsumerWidget {
  const AuthButton({super.key,required this.onPressed,required this.text,required this.isDarkTheme });
  final void Function()? onPressed;
  final String text;
  final bool isDarkTheme;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return isDarkTheme==true ? ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          backgroundColor: ColorConstants.loginTextFieldFocus,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(text,style: const TextStyle(color: ColorConstants.black,fontSize: 16,fontWeight: FontWeight.w500),)
    ):
    ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          backgroundColor: ColorConstants.loginLightButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(text,style: const TextStyle(color: ColorConstants.white,fontSize: 16,fontWeight: FontWeight.w500),)
    )
    ;
  }
}

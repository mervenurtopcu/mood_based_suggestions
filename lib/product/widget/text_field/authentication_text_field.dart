import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mood_based_suggestions/product/constants/color_constants.dart';

class AuthTextField extends ConsumerWidget {
  const AuthTextField(
      {super.key,
      required this.icon,
      required this.labelText,
      required this.isDarkTheme,
      required this.obscureText});
  final Icon icon;
  final String labelText;
  final bool isDarkTheme;
  final bool obscureText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return isDarkTheme == false
        ?
    TextField(
      textInputAction: TextInputAction.next,
      obscureText: obscureText,
      style: const TextStyle(color: ColorConstants.black),
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: ColorConstants.red),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        labelStyle: const TextStyle(color: ColorConstants.loginSubtitle,
            fontSize: 14,fontWeight: FontWeight.w300
        ),
        iconColor: ColorConstants.black,
        labelText: labelText,
        filled: true,
        fillColor: ColorConstants.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: ColorConstants.loginLightButton,
          ),
        ),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        prefixIcon: icon,
      ),
    )
        : TextField(
            textInputAction: TextInputAction.next,
            obscureText: obscureText,
            style: const TextStyle(color: ColorConstants.white),
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: ColorConstants.red),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              labelStyle: const TextStyle(color: ColorConstants.white,
              fontSize: 14,fontWeight: FontWeight.w300
              ),
              iconColor: ColorConstants.white,
              labelText: labelText,
              filled: true,
              fillColor: ColorConstants.loginTextField,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: ColorConstants.loginTextFieldFocus,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              prefixIcon: icon,
            ),
          );
  }
}

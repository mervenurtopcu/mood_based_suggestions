import 'package:flutter/material.dart';

@immutable
class LightTheme {
  const LightTheme._();

  static final ThemeData lightTheme = ThemeData.dark(
    useMaterial3: true,
  ).copyWith();
}
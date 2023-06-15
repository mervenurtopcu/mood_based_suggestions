import 'package:flutter/material.dart';

@immutable
class DarkTheme {
  const DarkTheme._();

  static final ThemeData darkTheme = ThemeData.dark(
    useMaterial3: true,
  ).copyWith();
}
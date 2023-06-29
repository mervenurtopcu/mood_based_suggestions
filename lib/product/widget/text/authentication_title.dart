import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mood_based_suggestions/product/constants/color_constants.dart';

class AuthTitle extends ConsumerWidget {
  const AuthTitle({super.key,required this.text,required this.isDarkTheme });
  final String text;
  final bool isDarkTheme ;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return isDarkTheme == false ? Text(text, style: const TextStyle(color:ColorConstants.black,fontSize: 30, fontWeight: FontWeight.bold)):
    Text(text, style: const TextStyle(color:ColorConstants.white,fontSize: 30, fontWeight: FontWeight.bold));
  }
}

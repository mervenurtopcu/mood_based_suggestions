import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mood_based_suggestions/product/constants/color_constants.dart';

class AuthSubtitle extends ConsumerWidget {
  const AuthSubtitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      text,
      style: const TextStyle(
          color: ColorConstants.loginSubtitle,
          fontSize: 16,
          fontWeight: FontWeight.w300),
    );
  }
}

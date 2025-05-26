import 'package:flutter/material.dart';
import 'colors.dart';

class AppStyles {
  static const String nunitoSans = 'Nunito Sans';
  static const String googleSans = 'Google Sans';

  static TextStyle heading1 = TextStyle(
    fontFamily: nunitoSans,
    fontSize: 40,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );

  static TextStyle heading2 = TextStyle(
    fontFamily: nunitoSans,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );

  static TextStyle body1 = TextStyle(
    fontFamily: nunitoSans,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );

  static TextStyle button = TextStyle(
    fontFamily: nunitoSans,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );

  static BoxDecoration cardDecoration = BoxDecoration(
    color: Color(0xFFF7F9FC),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: AppColors.neutral4),
    boxShadow: [
      BoxShadow(
        color: Color(0x0F1D4B19),
        offset: Offset(5.898, 7.864),
        blurRadius: 39.318,
      ),
    ],
  );
}

import 'package:clinician_app/src/utils/styles/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  //* Header styles

  /// fontSize: 24 fontWeight: FontWeight.w300 letterSpacing: 0.0
  static const h1 = TextStyle(
      fontSize: 24,
      color: AppColors.text,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.0);

  /// fontSize: 23 fontWeight: FontWeight.w300 letterSpacing: 0.0
  static const h2 = TextStyle(
      fontSize: 23,
      color: AppColors.text,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.0);

  /// fontSize: 22 fontWeight: FontWeight.w400 letterSpacing: 0.0
  static const h3 = TextStyle(
      fontSize: 22,
      color: AppColors.text,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0);

  /// fontSize: 21 fontWeight: FontWeight.w400 letterSpacing: 0.15
  static const h4 = TextStyle(
      fontSize: 21,
      color: AppColors.text,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15);

  /// fontSize: 20 fontWeight: FontWeight.w400 letterSpacing: 0.15
  static const h5 = TextStyle(
      fontSize: 20,
      color: AppColors.text,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15);

  /// fontSize: 19 fontWeight: FontWeight.w500 letterSpacing: 0.15
  static const h6 = TextStyle(
      fontSize: 19,
      color: AppColors.text,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15);

  //* Body styles

  /// fontSize: 16 fontWeight: FontWeight.w400 letterSpacing: 0.5
  static const b1 = TextStyle(
      fontSize: 16,
      color: AppColors.text,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5);

  /// fontSize: 15 fontWeight: FontWeight.w400 letterSpacing: 0.5
  static const b2 = TextStyle(
      fontSize: 15,
      color: AppColors.text,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5);

  /// fontSize: 14 fontWeight: FontWeight.w400 letterSpacing: 0.25
  static const b3 = TextStyle(
      fontSize: 14,
      color: AppColors.text,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  /// fontSize: 13 fontWeight: FontWeight.w400 letterSpacing: 0.25
  static const b4 = TextStyle(
      fontSize: 13,
      color: AppColors.text,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  /// fontSize: 12 fontWeight: FontWeight.w400 letterSpacing: 0.25
  static const b5 = TextStyle(
      fontSize: 12,
      color: AppColors.text,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);
}

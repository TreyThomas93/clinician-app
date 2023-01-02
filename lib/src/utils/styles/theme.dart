import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'textstyles.dart';

abstract class AppThemes {
  static get primaryTheme => ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: MaterialStateProperty.all<bool>(true),
          thumbColor: MaterialStateProperty.all<Color>(AppColors.gold),
          thickness: MaterialStateProperty.all<double>(5.0),
        ),
        textTheme: GoogleFonts.openSansTextTheme(),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.blueGrey,
        ),
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkBlue),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blueGrey,
          ),
        ),
        scaffoldBackgroundColor: AppColors.offWhite,
        inputDecorationTheme: InputDecorationTheme(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blueGrey),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            suffixIconColor: AppColors.gold,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            labelStyle: AppTextStyles.b3),
      );
}

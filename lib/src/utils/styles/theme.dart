import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

abstract class AppThemes {
  static get primaryTheme => ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: WidgetStateProperty.all<bool>(true),
          thumbColor: WidgetStateProperty.all<Color>(AppColors.gold),
          thickness: WidgetStateProperty.all<double>(5.0),
        ),
        textTheme: GoogleFonts.openSansTextTheme(),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.blueGrey,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkBlue,
          titleTextStyle: TextStyle(
            color: AppColors.offWhite,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: AppColors.offWhite),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blueGrey,
          ),
        ),
        scaffoldBackgroundColor: AppColors.offWhite,
        inputDecorationTheme: InputDecorationTheme(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.gold),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: AppColors.blueGrey)),
            suffixIconColor: AppColors.gold,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            labelStyle: const TextStyle(
              color: AppColors.blueGrey,
              fontSize: 16.0,
            )),
      );
}

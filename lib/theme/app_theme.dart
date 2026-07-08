import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: AppColors.background,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),

    textTheme: TextTheme(
      headlineMedium: const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),

      bodyLarge: TextStyle(
        fontSize: 18,
        color: Colors.white.withOpacity(0.9),
      ),
    ),
  );
}
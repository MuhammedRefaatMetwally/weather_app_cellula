import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'AppColors.dart';
class AppThemes {
  AppThemes._();

  static ThemeData get lightMode => ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      onPrimary: Colors.white, // Text/Icon color on primary elements
      onSecondary: Colors.black, // Text/Icon color on secondary elements
    ),
    primaryColor: AppColors.primaryColor,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    brightness: Brightness.light,

    // AppBar styling
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 0, // Flat, modern look
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(
        color: Colors.white, // White icons for better contrast
      ),
      titleTextStyle: TextStyle(
        color: Colors.white, // White text for app bar titles
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    // Text button styling
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.accentColor, // Accent color for buttons
      ),
    ),

    // Elevated button styling for primary action buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded edges for modern look
        ),
      ),
    ),

    // Input fields (e.g., TextField)
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.textFieldBackgroundColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: AppColors.hintColor),
    ),
  );
}

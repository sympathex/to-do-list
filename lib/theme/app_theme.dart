import 'package:flutter/material.dart';
import 'package:to_do_list/theme/theme_colors.dart';
import 'theme_manager.dart';

class AppTheme {
  // creating explicit ColorScheme objects to reuse inside ThemeData
  static  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.lightPrimary,
    cardColor: AppColors.lightCard,
    scaffoldBackgroundColor: Colors.transparent,     // transparent for image
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightPrimary,
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightText, fontSize: 18.0),
      bodyMedium: TextStyle(color: AppColors.lightText, fontSize: 16.0)
    ),
    iconTheme: const IconThemeData(color: AppColors.lightText),
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightAccent,
      surface: AppColors.lightCard,
      onSurface: AppColors.lightText,
    ),
    checkboxTheme: CheckboxThemeData(
      // fillColor: WidgetStateColor.resolveWith(
      //   (states) => states.contains(WidgetState.selected)
      //       ? colorScheme.secondary
      //       : colorScheme.onSurface.withValues(alpha: 0.6),
      // ),
      checkColor: WidgetStateProperty.all(AppColors.lightPrimary)
    ),    
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightCard,
        foregroundColor: AppColors.lightText,   // button text color
        textStyle: TextStyle(fontWeight: FontWeight.bold)
      )
    )
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    cardColor: AppColors.darkCard,
    scaffoldBackgroundColor: Colors.transparent,     // transparent for image
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkPrimary,
      foregroundColor: Colors.black,
      elevation: 2,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkText, fontSize: 18.0),
      bodyMedium: TextStyle(color: AppColors.darkText, fontSize: 16.0)
    ),
    iconTheme: const IconThemeData(color: AppColors.darkText),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkAccent,
      surface: AppColors.darkCard,
      onSurface: AppColors.darkText,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkCard,
        foregroundColor: AppColors.darkText,
        textStyle: TextStyle(fontWeight: FontWeight.bold)
      )
    )
  );
}

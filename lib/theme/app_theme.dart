import 'package:flutter/material.dart';
import 'package:to_do_list/theme/theme_colors.dart';

class AppTheme {
  // creating explicit ColorScheme objects to reuse inside ThemeData
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.lightPrimary,
    onPrimary: AppColors.lightPrimary,
    secondary: AppColors.lightAccent,
    onSecondary: AppColors.lightCard,
    surface: AppColors.lightCard,
    onSurface: AppColors.lightText,
    error: Colors.red,
    onError: Colors.white,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkPrimary,
    secondary: AppColors.darkAccent,
    onSecondary: AppColors.darkCard,
    surface: AppColors.darkCard,
    onSurface: AppColors.darkText,
    error: Colors.red,
    onError: Colors.white,
  );

  // Helper to apply alpha without using deprecated withOpacity()
  static Color _withAlpha(Color c, double alpha) {
    return Color.fromARGB((alpha * 255).round(), c.red, c.green, c.blue);
  }

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
    primaryColor: lightColorScheme.primary,
    cardColor: lightColorScheme.surface,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme.primary,
      foregroundColor: lightColorScheme.onPrimary,
      titleTextStyle: TextStyle(
        color: lightColorScheme.onPrimary,
        fontWeight: FontWeight.bold,
      ),
      elevation: 2,
    ),

    // text & icon defaults
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightText, fontSize: 18.0),
      bodyMedium: TextStyle(color: AppColors.lightText, fontSize: 16.0),
    ),
    iconTheme: IconThemeData(color: lightColorScheme.onSurface),

    //Checkbox theme: fillColor reacts to selected/unselected states
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? lightColorScheme.surface                        // selected -> accent
            : _withAlpha(lightColorScheme.onSurface, 0.6),      // unselected -> slightly faded surface
      ),
      checkColor: WidgetStateProperty.all(AppColors.darkPrimary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),    

    // Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColorScheme.surface,
        foregroundColor: lightColorScheme.onSurface,   // button text color
        textStyle: TextStyle(fontWeight: FontWeight.bold)
      )
    )
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    primaryColor: darkColorScheme.primary,
    cardColor: darkColorScheme.surface,
    scaffoldBackgroundColor: Colors.transparent,     // transparent for image
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.primary,
      foregroundColor: darkColorScheme.onPrimary,
      titleTextStyle: TextStyle(
        color: darkColorScheme.onPrimary,
        fontWeight: FontWeight.bold,
      ),
      elevation: 2,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkText, fontSize: 18.0),
      bodyMedium: TextStyle(color: AppColors.darkText, fontSize: 16.0)
    ),
    iconTheme: IconThemeData(color: darkColorScheme.onSurface),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColorScheme.surface,
        foregroundColor: darkColorScheme.onSurface,
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        elevation: 0,
        shape: StadiumBorder()
      )
    ),
    
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? darkColorScheme.secondary                        // selected -> accent
            : _withAlpha(darkColorScheme.onSurface, 0.6),      // unselected -> slightly faded surface
      ),
      checkColor: WidgetStateProperty.all(AppColors.lightPrimary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),    
  );
}

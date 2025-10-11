import 'package:flutter/material.dart';

class AppColors {
  // Light Mode Theme Colors
  //static const Color lightBackground = Color();
  static const Color lightPrimary = Color(0xFFbdac86);
  static const Color lightAccent = Color(0xFFa48d78);
  static const Color lightText = Color(0xFF472f26);
  static const Color lightCard = Color(0xFFe6dac8);

  // Dark Mode Theme Colors
  static const Color darkPrimary = Color(0xFF3d211a);
  static const Color darkAccent = Color(0xFFa07856);
  static const Color darkText = Color(0xFFded1ba);
  static const Color darkCard = Color(0xFF6f4d38);

  // Background Image paths
  static const String lightBackgroundImage = 'assets/lightBG.jpg';
  static const String darkBackgroundImage = 'assets/darkBG.jpg';
}

// Widget that swaps background image based on theme
class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key , required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgImage = AssetImage(
      isDark
          ? AppColors.darkBackgroundImage
          : AppColors.lightBackgroundImage,
    );
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: bgImage,
          fit: BoxFit.cover,
        )
      ),
      child: child,
    );
  }
}
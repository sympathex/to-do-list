import 'package:flutter/material.dart';
import 'package:to_do_list/theme/theme_colors.dart';

class ThemeNotifier {
  // start with system theme
  static final ValueNotifier<ThemeMode> themeModeNotifier =
      ValueNotifier(ThemeMode.system);

  // method to update theme
  static void setTheme(ThemeMode mode) {
    themeModeNotifier.value = mode;
  }
}

// a  widget for switching between light/dark/system themes
class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeNotifier.themeModeNotifier,
      builder: (context, themeMode, _) {
        final isDark = themeMode == ThemeMode.dark;
        return IconButton(
          onPressed: () {
            ThemeNotifier.setTheme(isDark ? ThemeMode.light : ThemeMode.dark);
          },
          icon: AnimatedSwitcher(
            duration: const Duration(microseconds: 300),
            transitionBuilder: (child, animation) => RotationTransition(
              turns: child.key == const ValueKey('light')
                  ? Tween<double>(begin: 0.75, end: 1).animate(animation)
                  : Tween<double>(begin: 1.25, end: 1).animate(animation),
              child: child,
            ),
            child: Icon(
              isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
              key: ValueKey(isDark ? 'dark' : 'light'),
              size: 28.0,
              color: isDark ? AppColors.darkText : AppColors.lightText,
            ),
          ),
        );
      },
    );
  }
}
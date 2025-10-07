import 'package:flutter/material.dart';

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
class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'light') {
          ThemeNotifier.setTheme(ThemeMode.light);
        } else if (value == 'dark') {
          ThemeNotifier.setTheme(ThemeMode.dark);
        } else {
          ThemeNotifier.setTheme(ThemeMode.system);
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(value: 'light', child: Text('Light Mode')),
        PopupMenuItem(value: 'dark', child: Text('Dark Mode')),
        PopupMenuItem(value: 'system', child: Text('System Default'))
      ]
    );
  }
}
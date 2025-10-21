import 'package:flutter/material.dart';
import 'package:quizz_app/data/constants.dart';
import 'package:quizz_app/data/notifiers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchThemeWidget extends StatelessWidget {
  const SwitchThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return IconButton(
          icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          color: isDarkMode
              ? Colors.white
              : Theme.of(context).colorScheme.primary,
          onPressed: () async {
            isDarkModeNotifier.value = !isDarkMode;
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.setBool(KConstants.themeModeKey, isDarkModeNotifier.value);
          },
        );
      },
    );
  }
}

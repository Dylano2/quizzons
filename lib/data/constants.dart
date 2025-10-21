import 'package:flutter/material.dart';

class KConstants {
  static const String themeModeKey = 'isDarkMode';
  static const String appName = 'Quizzons !';
  static const String startButton = "Commencer";
}

class KTextStyle {
  static const TextStyle mainTitle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle mainButtonText = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w300,
    letterSpacing: 20,
  );
}

class KButtonStyle {
  static final ButtonStyle kAmberButtonStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    elevation: 1,
    enableFeedback: false,
  );
}

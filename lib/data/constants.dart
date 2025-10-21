import 'package:flutter/material.dart';

class KConstants {
  static const String themeModeKey = 'isDarkMode';
  static const String pseudoKey = 'pseudo';
  static const String difficultyKey = 'difficulty';

  static const String appName = 'Quizzons !';
  static const String startButton = "Commencer";
  static const String enterYourName = "Entre un pseudo : ";
  static const String submitNameButton = "C'est parti !";
  static const String choseYourDifficulty = "Choisis la difficulté";
  static const String easyDifficulty = "Facile";
  static const String mediumDifficulty = "Moyenne";
  static const String hardDifficulty = "Hardcore";
  static const List<String> difficultyLevels = [
    easyDifficulty,
    mediumDifficulty,
    hardDifficulty,
  ];

  static const Map<String, String> toApiSlug = {
    easyDifficulty: 'easy',
    mediumDifficulty: 'medium',
    hardDifficulty: 'hard',
  };
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

  static const TextStyle primaryText = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle submitButtonText = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w300,
  );
}

class KButtonStyle {
  static final ButtonStyle kAmberButtonStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    elevation: 1,
    enableFeedback: false,
  );
}

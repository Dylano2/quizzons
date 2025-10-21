import 'package:flutter/material.dart';
import 'package:quizz_app/data/constants.dart';
import 'package:quizz_app/widgets/difficulty_selector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  late Future<String?> difficulty;

  @override
  void initState() {
    difficulty = getDifficulty();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: difficulty,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return Container(height: 20, width: 20, color: Colors.green);
        }

        return DifficultySelector(
          onDifficultySelected: handleSetDifficulty,
          onReloadRequested: reloadDifficulty,
        );
      },
    );
  }

  Future<void> handleSetDifficulty(String difficultyLevel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(KConstants.difficultyKey, difficultyLevel);
  }

  void reloadDifficulty() {
    setState(() {
      difficulty = getDifficulty();
    });
  }

  Future<String?> getDifficulty() async {
    print("getDifficulty yooooo");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? chosenDifficulty = prefs.getString(KConstants.difficultyKey);
    print(chosenDifficulty);
    return chosenDifficulty;
  }
}

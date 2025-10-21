import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quizz_app/data/classes/Api_Response.dart';
import 'package:quizz_app/data/classes/question_class.dart';
import 'package:quizz_app/data/constants.dart';
import 'package:quizz_app/widgets/difficulty_selector.dart';
import 'package:quizz_app/widgets/question_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  late Future<String?> difficulty;
  Future<ApiResponse>? apiResponse;

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
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          apiResponse ??= fetchData(snapshot.data!);
          return FutureBuilder(
            future: apiResponse,
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (asyncSnapshot.connectionState == ConnectionState.done &&
                  asyncSnapshot.hasData) {
                final List<Question>? questions = asyncSnapshot.data?.results;
                if (questions == null) return Center(child: Text("Error"));
                return QuestionList(questionList: questions);
              }
              return Center(child: Text("Error"));
            },
          );
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

  Future<ApiResponse> fetchData(String difficulty) async {
    final difficultyToSend = KConstants.toApiSlug[difficulty];

    var url = Uri.https('opentdb.com', '/api.php', {
      'amount': 5.toString(),
      'difficulty': difficultyToSend,
      'type': 'multiple',
    });

    var response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return ApiResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw new Error();
    }
  }
}

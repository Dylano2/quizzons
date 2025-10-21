import 'package:flutter/material.dart';
import 'package:quizz_app/data/classes/question_class.dart';
import 'package:quizz_app/data/notifiers.dart';

class DisplayQuestion extends StatelessWidget {
  final Question question;
  final void Function() onClick;

  const DisplayQuestion({
    super.key,
    required this.question,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> answers = [
      question.correctAnswer,
      ...question.incorrectAnswers,
    ];
    print(question.toString());

    answers.shuffle();
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Text(question.question, style: TextStyle(fontSize: 20)),
          ),
          ...answers.map(
            (answer) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder(
                valueListenable: scoreNotifier,
                builder: (context, score, child) {
                  return ElevatedButton(
                    onPressed: () {
                      scoreNotifier.value += checkAnswer(question, answer);
                      onClick();
                    },
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: Center(child: Text(answer)),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  int checkAnswer(Question question, String answer) {
    if (answer == question.correctAnswer) {
      return 1;
    } else {
      return 0;
    }
  }
}

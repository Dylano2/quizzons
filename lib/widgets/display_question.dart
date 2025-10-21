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
    return Column(
      children: [
        Text(question.question),
        ...answers.map(
          (answer) => ValueListenableBuilder(
            valueListenable: scoreNotifier,
            builder: (context, score, child) {
              return ElevatedButton(
                onPressed: () {
                  print(answer);
                  scoreNotifier.value += checkAnswer(question, answer);
                  onClick();
                },
                child: Text(answer),
              );
            },
          ),
        ),
      ],
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

import 'package:flutter/material.dart';
import 'package:quizz_app/data/classes/question_class.dart';
import 'package:quizz_app/widgets/display_question.dart';
import 'package:quizz_app/widgets/score_card.dart';

class QuestionList extends StatefulWidget {
  final List<Question> questionList;

  const QuestionList({super.key, required this.questionList});

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex >= widget.questionList.length) {
      return ScoreCard(totalQuestion: widget.questionList.length);
    }
    return Column(
      children: [
        DisplayQuestion(
          question: widget.questionList[currentIndex],
          onClick: onClick,
        ),
        Text(
          '${currentIndex + 1} / ${widget.questionList.length}',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  onClick() {
    setState(() {
      currentIndex++;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:quizz_app/data/classes/question_class.dart';
import 'package:quizz_app/widgets/display_question.dart';

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
    return DisplayQuestion(
      question: widget.questionList[currentIndex],
      onClick: onClick,
    );
  }

  onClick() {
    setState(() {
      if (currentIndex == widget.questionList.length) {
        currentIndex = 0;
      } else {
        currentIndex++;
      }
    });
  }
}

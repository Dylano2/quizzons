class Question {
  final String type;
  final String difficulty;
  final String category;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  Question({
    required this.type,
    required this.difficulty,
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      type: json['type'] as String,
      difficulty: json['difficulty'] as String,
      category: json['category'] as String,
      question: json['question'] as String,
      correctAnswer: json['correct_answer'] as String,
      incorrectAnswers: (json['incorrect_answers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
  }

  List<String> getAllAnswers() {
    final List<String> answers = [...incorrectAnswers, correctAnswer];
    answers.shuffle();
    return answers;
  }

  @override
  String toString() {
    return 'Question(\n'
        '  type: $type,\n'
        '  difficulty: $difficulty,\n'
        '  category: $category,\n'
        '  question: $question,\n'
        '  correctAnswer: $correctAnswer,\n'
        '  incorrectAnswers: $incorrectAnswers\n'
        ')';
  }
}

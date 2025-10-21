import 'package:quizz_app/data/classes/question_class.dart';

class ApiResponse {
  final int responseCode;
  final List<Question> results;

  ApiResponse({required this.responseCode, required this.results});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> resultsJson = json['results'] as List<dynamic>;

    final List<Question> questions = resultsJson
        .map((item) => Question.fromJson(item as Map<String, dynamic>))
        .toList();

    return ApiResponse(
      responseCode: json['response_code'] as int,
      results: questions,
    );
  }
}

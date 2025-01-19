class QuizModel {
  final int responseCode;
  final List<Result> results;

  QuizModel({required this.responseCode, required this.results});

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      responseCode: json['response_code'],
      results: (json['results'] as List)
          .map((item) => Result.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response_code': responseCode,
      'results': results.map((item) => item.toJson()).toList(),
    };
  }
}

class Result {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  Result({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      category: json['category'],
      type: json['type'],
      difficulty: json['difficulty'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers:
          List<String>.from(json['incorrect_answers'] as List<dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'type': type,
      'difficulty': difficulty,
      'question': question,
      'correct_answer': correctAnswer,
      'incorrect_answers': incorrectAnswers,
    };
  }
}

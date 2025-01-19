// class Question {
//   final String question;
//   final String correctAnswer;
//   final List<String> incorrectAnswers;
//   final String category;
//   final String difficulty;
//   List<String> allAnswers = [];

//   Question({
//     required this.question,
//     required this.correctAnswer,
//     required this.incorrectAnswers,
//     required this.category,
//     required this.difficulty,
//   }) {
//     allAnswers = [...incorrectAnswers, correctAnswer];
//     allAnswers.shuffle();
//   }

//   factory Question.fromJson(Map<String, dynamic> json) {
//     return Question(
//       question: json['question'],
//       correctAnswer: json['correct_answer'],
//       incorrectAnswers: List<String>.from(json['incorrect_answers']),
//       category: json['category'],
//       difficulty: json['difficulty'],
//     );
//   }
// }

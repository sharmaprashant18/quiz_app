// class QuizModel {
//   final int? responseCode;
//   final List<Results>? results;

//   QuizModel({
//     this.responseCode,
//     this.results,
//   });

//   factory QuizModel.fromJson(Map<String, dynamic> json) {
//     return QuizModel(
//       responseCode: json['response_code'] as int?,
//       results: json['results'] != null
//           ? List<Results>.from(
//               json['results'].map((x) => Results.fromJson(x)),
//             )
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'response_code': responseCode,
//       'results': results?.map((x) => x.toJson()).toList(),
//     };
//   }
// }

// class Results {
//   final String? type;
//   final String? difficulty;
//   final String? category;
//   final String? question;
//   final String? correctAnswer;
//   final List<String>? incorrectAnswers;

//   Results({
//     this.type,
//     this.difficulty,
//     this.category,
//     this.question,
//     this.correctAnswer,
//     this.incorrectAnswers,
//   });

//   factory Results.fromJson(Map<String, dynamic> json) {
//     return Results(
//       type: json['type'] as String?,
//       difficulty: json['difficulty'] as String?,
//       category: json['category'] as String?,
//       question: json['question'] as String?,
//       correctAnswer: json['correct_answer'] as String?,
//       incorrectAnswers: json['incorrect_answers'] != null
//           ? List<String>.from(json['incorrect_answers'])
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'type': type,
//       'difficulty': difficulty,
//       'category': category,
//       'question': question,
//       'correct_answer': correctAnswer,
//       'incorrect_answers': incorrectAnswers,
//     };
//   }
// }

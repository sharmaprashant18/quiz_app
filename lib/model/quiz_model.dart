// class QuizModel {
//   int? id;
//   String? question;
//   String? description;
//   Answers? answers;
//   String? multipleCorrectAnswers;
//   CorrectAnswers? correctAnswers;
//   String? explanation;

//   String? category;
//   String? difficulty;

//   QuizModel(
//       {this.id,
//       this.question,
//       this.description,
//       this.answers,
//       this.multipleCorrectAnswers,
//       this.correctAnswers,
//       this.explanation,
//       this.category,
//       this.difficulty});

//   QuizModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     question = json['question'];
//     description = json['description'];
//     answers =
//         json['answers'] != null ? new Answers.fromJson(json['answers']) : null;
//     multipleCorrectAnswers = json['multiple_correct_answers'];
//     correctAnswers = json['correct_answers'] != null
//         ? new CorrectAnswers.fromJson(json['correct_answers'])
//         : null;
//     explanation = json['explanation'];

//     category = json['category'];
//     difficulty = json['difficulty'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['question'] = this.question;
//     data['description'] = this.description;
//     if (this.answers != null) {
//       data['answers'] = this.answers!.toJson();
//     }
//     data['multiple_correct_answers'] = this.multipleCorrectAnswers;
//     if (this.correctAnswers != null) {
//       data['correct_answers'] = this.correctAnswers!.toJson();
//     }
//     data['explanation'] = this.explanation;

//     data['category'] = this.category;
//     data['difficulty'] = this.difficulty;
//     return data;
//   }
// }

// class Answers {
//   String? answerA;
//   String? answerB;
//   String? answerC;
//   String? answerD;
//   Null answerE;
//   Null answerF;

//   Answers(
//       {this.answerA,
//       this.answerB,
//       this.answerC,
//       this.answerD,
//       this.answerE,
//       this.answerF});

//   Answers.fromJson(Map<String, dynamic> json) {
//     answerA = json['answer_a'];
//     answerB = json['answer_b'];
//     answerC = json['answer_c'];
//     answerD = json['answer_d'];
//     answerE = json['answer_e'];
//     answerF = json['answer_f'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['answer_a'] = this.answerA;
//     data['answer_b'] = this.answerB;
//     data['answer_c'] = this.answerC;
//     data['answer_d'] = this.answerD;
//     data['answer_e'] = this.answerE;
//     data['answer_f'] = this.answerF;
//     return data;
//   }
// }

// class CorrectAnswers {
//   String? answerACorrect;
//   String? answerBCorrect;
//   String? answerCCorrect;
//   String? answerDCorrect;
//   String? answerECorrect;
//   String? answerFCorrect;

//   CorrectAnswers(
//       {this.answerACorrect,
//       this.answerBCorrect,
//       this.answerCCorrect,
//       this.answerDCorrect,
//       this.answerECorrect,
//       this.answerFCorrect});

//   CorrectAnswers.fromJson(Map<String, dynamic> json) {
//     answerACorrect = json['answer_a_correct'];
//     answerBCorrect = json['answer_b_correct'];
//     answerCCorrect = json['answer_c_correct'];
//     answerDCorrect = json['answer_d_correct'];
//     answerECorrect = json['answer_e_correct'];
//     answerFCorrect = json['answer_f_correct'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['answer_a_correct'] = this.answerACorrect;
//     data['answer_b_correct'] = this.answerBCorrect;
//     data['answer_c_correct'] = this.answerCCorrect;
//     data['answer_d_correct'] = this.answerDCorrect;
//     data['answer_e_correct'] = this.answerECorrect;
//     data['answer_f_correct'] = this.answerFCorrect;
//     return data;
//   }
// }

class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);

  static Future<Question> fromJson(jsonDecode) async {
    // Add your JSON parsing logic here
    return Question(
      jsonDecode['questionText'],
      (jsonDecode['answersList'] as List)
          .map((answer) => Answer(answer['answerText'], answer['isCorrect']))
          .toList(),
    );
  }
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "Who is the owner of Flutter?",
    [
      Answer("Nokia", false),
      Answer("Samsung", false),
      Answer("Google", true),
      Answer("Apple", false),
    ],
  ));

  list.add(Question(
    "Who owns Iphone?",
    [
      Answer("Apple", true),
      Answer("Microsoft", false),
      Answer("Google", false),
      Answer("Nokia", false),
    ],
  ));

  list.add(Question(
    "Youtube is _________  platform?",
    [
      Answer("Music Sharing", false),
      Answer("Video Sharing", false),
      Answer("Live Streaming", false),
      Answer("All of the above", true),
    ],
  ));

  list.add(Question(
    "Flutter user dart as a language?",
    [
      Answer("True", true),
      Answer("False", false),
    ],
  ));

  return list;
}

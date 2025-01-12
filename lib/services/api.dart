import 'dart:convert';

import 'package:quiz_app/model/quiz_model.dart';
import 'package:http/http.dart' as http;

class QuizApi {
  final String quizApp = 'https://quizapi.io/api/v1/questions';
  Future<QuizModel> getQuestion() async {
    try {
      final response = await http.get(Uri.parse(quizApp));
      if (response.statusCode == 200) {
        return QuizModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load quiz question');
      }
    } catch (e) {
      throw Exception('Failed to load quiz question');
    }
  }
}

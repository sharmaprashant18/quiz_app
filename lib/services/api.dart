// import 'dart:convert';
// import 'package:quiz_app/model/quiz_model.dart';
// import 'package:http/http.dart' as http;

// class QuizApi {
//   static const String baseUrl = 'https://opentdb.com/api.php';
//   final String apiKey = 'rzZSZpdqalqmiWiCOsmbhAWACRv8mlzuLVAA3O5N';

//   Future<QuizModel> getQuestion() async {
//     try {
//       final uri = Uri.parse('$baseUrl?amount=50');
//       final response = await http.get(
//         uri,
//         headers: {'Authorization': 'Bearer $apiKey'},
//       );

//       if (response.statusCode == 200) {
//         return QuizModel.fromJson(jsonDecode(response.body));
//       } else {
//         throw Exception(
//             'Failed to load quiz questions: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load quiz questions: $e');
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:quiz_app/model/questions.dart';

class QuizApi {
  final Dio _dio = Dio();

  Future<List<Question>> fetchQuestions() async {
    try {
      final response = await _dio.get('https://opentdb.com/api.php?amount=50');
      if (response.statusCode == 200) {
        final data = response.data;
        final questions = (data['results'] as List)
            .map((json) => Question.fromJson(json))
            .toList();
        return questions;
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (e) {
      throw Exception('Error fetching questions: $e');
    }
  }
}

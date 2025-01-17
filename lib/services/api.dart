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

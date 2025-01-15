import 'dart:convert';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:http/http.dart' as http;

class QuizApi {
  static const String baseUrl = 'https://opentdb.com/api.php';
  final String apiKey = 'rzZSZpdqalqmiWiCOsmbhAWACRv8mlzuLVAA3O5N';

  Future<QuizModel> getQuestion() async {
    try {
      final uri = Uri.parse('$baseUrl?amount=50');
      final response = await http.get(
        uri,
        headers: {'Authorization': 'Bearer $apiKey'},
      );

      if (response.statusCode == 200) {
        return QuizModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed to load quiz questions: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load quiz questions: $e');
    }
  }
}

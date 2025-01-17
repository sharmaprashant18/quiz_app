import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/model/questions.dart';
import 'package:quiz_app/services/api.dart';

final quizApiProvider = Provider((ref) => QuizApi());

final questionsProvider = FutureProvider<List<Question>>((ref) async {
  final quizApi = ref.read(quizApiProvider);
  return await quizApi.fetchQuestions();
});

final currentQuestionIndexProvider = StateProvider<int>((ref) => 0);
final scoreProvider = StateProvider<int>((ref) => 0);
final timerProvider = StateProvider<int>((ref) => 30);
final isAnsweredProvider = StateProvider<bool>((ref) => false);

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:quiz_app/provider/quiz_provider.dart';
import 'package:quiz_app/view/homepage.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.read(questionsProvider).value ?? [];
    final score = ref.read(scoreProvider);
    final percentage = (score / questions.length) * 100;

    String message;
    Color messageColor;

    if (percentage >= 80) {
      message = 'Excellent!';
      messageColor = Colors.green;
    } else if (percentage >= 60) {
      message = 'Good job!';
      messageColor = Colors.blue;
    } else {
      message = 'Keep practicing!';
      messageColor = Colors.orange;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: messageColor,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Score: $score/${questions.length}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              '${percentage.toStringAsFixed(1)}%',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                ref.read(currentQuestionIndexProvider.notifier).state = 0;
                ref.read(scoreProvider.notifier).state = 0;
                ref.read(timerProvider.notifier).state = 30;
                ref.read(isAnsweredProvider.notifier).state = false;

                Get.to(() => Homepage());
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              child: const Text(
                'Back to Home',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

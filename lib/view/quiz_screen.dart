import 'package:flutter/material.dart';
import 'package:quiz_app/model/category.dart';
import 'dart:async';

import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final Category category;

  const QuizScreen({Key? key, required this.category}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  int timeLeft = 30;
  Timer? timer;
  List<int?> userAnswers = List.filled(5, null);

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        moveToNext();
      }
    });
  }

  void moveToNext() {
    timer?.cancel();
    if (currentQuestionIndex < widget.category.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        timeLeft = 30;
      });
      startTimer();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
            totalQuestions: widget.category.questions.length,
            category: widget.category,
          ),
        ),
      );
    }
  }

  void checkAnswer(int selectedIndex) {
    if (userAnswers[currentQuestionIndex] == null) {
      setState(() {
        userAnswers[currentQuestionIndex] = selectedIndex;
      });

      if (selectedIndex ==
          widget.category.questions[currentQuestionIndex].correctAnswerIndex) {
        setState(() {
          score++;
        });
      }

      Future.delayed(const Duration(milliseconds: 500), () {
        moveToNext();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.category.questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: timeLeft / 30,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 8),
            Text(
              'Time left: $timeLeft seconds',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Text(
              'Question ${currentQuestionIndex + 1} of ${widget.category.questions.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  question.question,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  final isSelected = userAnswers[currentQuestionIndex] == index;
                  final isCorrect = index == question.correctAnswerIndex;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () => checkAnswer(index),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected
                            ? (isCorrect ? Colors.green : Colors.red)
                            : Colors.blue,
                        padding: const EdgeInsets.all(16),
                      ),
                      child: Text(
                        question.options[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

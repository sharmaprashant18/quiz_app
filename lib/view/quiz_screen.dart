// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'dart:async';
// import '../provider/quiz_provider.dart';

// import 'result_screen.dart';

// class QuizScreen extends ConsumerStatefulWidget {
//   const QuizScreen({Key? key}) : super(key: key);

//   @override
//   _QuizScreenState createState() => _QuizScreenState();
// }

// class _QuizScreenState extends ConsumerState<QuizScreen> {
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   void startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       final currentTime = ref.read(timerProvider);
//       if (currentTime > 0) {
//         ref.read(timerProvider.notifier).state--;
//       } else {
//         moveToNext();
//       }
//     });
//   }

//   void moveToNext() {
//     _timer?.cancel();
//     final questions = ref.read(questionsProvider).value ?? [];
//     final currentIndex = ref.read(currentQuestionIndexProvider);

//     if (currentIndex < questions.length - 1) {
//       ref.read(currentQuestionIndexProvider.notifier).state++;
//       ref.read(timerProvider.notifier).state = 30;
//       ref.read(isAnsweredProvider.notifier).state = false;
//       startTimer();
//     } else {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const ResultScreen(),
//         ),
//       );
//     }
//   }

//   void checkAnswer(String selectedAnswer, String correctAnswer) {
//     if (!ref.read(isAnsweredProvider)) {
//       ref.read(isAnsweredProvider.notifier).state = true;
//       if (selectedAnswer == correctAnswer) {
//         ref.read(scoreProvider.notifier).state++;
//       }
//       Future.delayed(const Duration(milliseconds: 500), moveToNext);
//     }
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final questionsAsyncValue = ref.watch(questionsProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Quiz'),
//         leading: IconButton(
//           icon: const Icon(Icons.close),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: questionsAsyncValue.when(
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (error, stack) => Center(
//           child: Text('Error: $error'),
//         ),
//         data: (questions) {
//           final currentIndex = ref.watch(currentQuestionIndexProvider);
//           final currentQuestion = questions[currentIndex];
//           final timeLeft = ref.watch(timerProvider);
//           final isAnswered = ref.watch(isAnsweredProvider);

//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 LinearProgressIndicator(
//                   value: timeLeft / 30,
//                   backgroundColor: Colors.grey[200],
//                   valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   'Time left: $timeLeft seconds',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 24),
//                 Text(
//                   'Question ${currentIndex + 1} of ${questions.length}',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(fontSize: 18),
//                 ),
//                 Text(
//                   'Category: ${currentQuestion.category}',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(fontSize: 16, color: Colors.grey),
//                 ),
//                 const SizedBox(height: 16),
//                 Card(
//                   elevation: 4,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       currentQuestion.question,
//                       style: const TextStyle(fontSize: 20),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: currentQuestion.allAnswers.length,
//                     itemBuilder: (context, index) {
//                       final answer = currentQuestion.allAnswers[index];
//                       final isCorrect = answer == currentQuestion.correctAnswer;
//                       Color? buttonColor;

//                       if (isAnswered) {
//                         buttonColor = isCorrect ? Colors.green : Colors.red;
//                       }

//                       return Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8.0),
//                         child: ElevatedButton(
//                           onPressed: () => checkAnswer(
//                             answer,
//                             currentQuestion.correctAnswer,
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: buttonColor,
//                             padding: const EdgeInsets.all(16),
//                           ),
//                           child: Text(
//                             answer,
//                             style: const TextStyle(fontSize: 16),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

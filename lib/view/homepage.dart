// import 'package:flutter/material.dart';
// import 'package:quiz_app/model/quiz_model.dart';

// class Homepage extends StatefulWidget {
//   Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   QuizModel? response;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 1,
//           toolbarHeight: 120,
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Hi, JOHN',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//               ),
//               SizedBox(
//                 height: 3,
//               ),
//               Text(
//                 "Let's make the day productive",
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//             ],
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: CircleAvatar(
//                 radius: 40,
//                 backgroundImage: AssetImage(
//                   'assets/icon_image.png',
//                 ),
//               ),
//             )
//           ],
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 150,
//               child: Card(
//                 margin: EdgeInsets.all(20),
//                 color: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 elevation: 10,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     CircleAvatar(
//                       radius: 35,
//                       backgroundImage: AssetImage(
//                         'assets/reward.png',
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: reward("Ranking", '348'),
//                     ),
//                     CircleAvatar(
//                       radius: 40,
//                       backgroundImage: AssetImage(
//                         'assets/coin.png',
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: reward("Points", '1200'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       "Let's play",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       'Questions:' +
//                           (response?.question?.toString() ??
//                               "Question Not available"),
//                       style: TextStyle(fontSize: 40),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget reward(String title, String data) {
//     return Container(
//       child: Column(
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 25,
//             ),
//           ),
//           Text(
//             data,
//             style: TextStyle(
//                 fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //define the datas
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            "Simple Quiz App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          _questionWidget(),
          _answerList(),
          _nextButton(),
        ]),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: const StadiumBorder(),
          backgroundColor: isSelected ? Colors.orangeAccent : Colors.white,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(isLastQuestion ? "Submit" : "Next"),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          backgroundColor: Colors.blueAccent,
        ),
        onPressed: () {
          if (isLastQuestion) {
            //display score

            showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            //next question
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
      ),
    );
  }

  _showScoreDialog() {
    bool isPassed = false;

    if (score >= questionList.length * 0.6) {
      //pass if 60 %
      isPassed = true;
    }
    String title = isPassed ? "Passed " : "Failed";

    return AlertDialog(
      title: Text(
        title + " | Score is $score",
        style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent),
      ),
      content: ElevatedButton(
        child: const Text("Restart"),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
      ),
    );
  }
}

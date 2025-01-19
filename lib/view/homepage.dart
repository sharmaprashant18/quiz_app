import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/view/quiz_screen.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Color(0xff010131),
            image: DecorationImage(
                image: AssetImage('assets/quiz_home.png'),
                fit: BoxFit.contain)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 350),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(() => QuizScreen());
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    backgroundColor: Colors.amber),
                child: Text(
                  'Start Quiz',
                  style: TextStyle(fontSize: 18),
                )),
          ),
        ),
      ),
    );
  }
}

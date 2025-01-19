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
            image: DecorationImage(
                image: AssetImage('assets/quiz_home.png'), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Let's Play",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
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
            ],
          ),
        ),
      ),
    );
  }
}

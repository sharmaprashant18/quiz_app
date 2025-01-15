// import 'package:flutter/material.dart';
// import 'package:quiz_app/view/homepage.dart';

// void main() {
//   runApp(Home());
// }

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // fontFamily: "Montserrat",
//         colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffF0EEE5)),
//       ),
//       home: Homepage(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:quiz_app/view/homepage.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: F,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

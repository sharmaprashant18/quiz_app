import 'package:flutter/material.dart';
import 'package:quiz_app/view/homepage.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: "Montserrat",
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffF0EEE5)),
      ),
      home: Homepage(),
    );
  }
}

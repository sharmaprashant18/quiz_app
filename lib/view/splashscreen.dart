import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:quiz_app/view/homepage.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final actualHeight = MediaQuery.of(context).size.height;
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset('assets/quiz_animation.json'),
          )
        ],
      ),
      nextScreen: Homepage(),
      splashIconSize: actualHeight * 0.7,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Duration(milliseconds: 500),
      backgroundColor: Colors.white,
    );
  }
}

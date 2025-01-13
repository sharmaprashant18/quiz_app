import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text('Play Quiz'),
          ),
          body: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Colors.black,
            child: Text(
              'Hello',
              style: TextStyle(color: Colors.black),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Play Quiz'),
      ),
      body: Container(
          child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        child: Row(
          children: [
            Image.asset('assets/moru_backgroung.png'),
            Image.asset('assets/moru_backgroung.png'),
          ],
        ),
      )),
    ));
  }
}

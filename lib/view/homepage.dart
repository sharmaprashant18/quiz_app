import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          toolbarHeight: 100,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, JOHN',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                "Let's make the day productive",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          actions: [
            IconButton(
              isSelected: true,
              onPressed: () {},
              icon: Image.asset(
                'assets/icon_image.png',
              ),
            )
          ],
        ),
        body: Container(),
      ),
    );
  }
}

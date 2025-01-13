import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   actions: [
        //     IconButton(onPressed: () {}, icon: Icon(Icons.add_ic_call_outlined))
        //   ],
        // ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Hi, John',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.abc))
                ],
              )

              // Text(
              //   "Let's make this day productive",
              //   style: TextStyle(fontSize: 16, color: Colors.grey),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

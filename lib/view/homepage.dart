import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          toolbarHeight: 120,
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
              onPressed: () {},
              icon: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  'assets/icon_image.png',
                ),
              ),
            )
          ],
        ),
        body: SizedBox(
          height: 150,
          child: Card(
            margin: EdgeInsets.all(20),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    'assets/reward.png',
                  ),
                ),
                reward("Ranking", '348'),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    'assets/coin.png',
                  ),
                ),
                reward("Points", '1200'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget reward(String title, String data) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            data,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

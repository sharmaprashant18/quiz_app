// import 'package:flutter/material.dart';
// import 'package:quiz_app/model/quiz_model.dart';

// class Homepage extends StatefulWidget {
//   Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   QuizModel? response;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 1,
//           toolbarHeight: 120,
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Hi, JOHN',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//               ),
//               SizedBox(
//                 height: 3,
//               ),
//               Text(
//                 "Let's make the day productive",
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//             ],
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: CircleAvatar(
//                 radius: 40,
//                 backgroundImage: AssetImage(
//                   'assets/icon_image.png',
//                 ),
//               ),
//             )
//           ],
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 150,
//               child: Card(
//                 margin: EdgeInsets.all(20),
//                 color: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 elevation: 10,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     CircleAvatar(
//                       radius: 35,
//                       backgroundImage: AssetImage(
//                         'assets/reward.png',
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: reward("Ranking", '348'),
//                     ),
//                     CircleAvatar(
//                       radius: 40,
//                       backgroundImage: AssetImage(
//                         'assets/coin.png',
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: reward("Points", '1200'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       "Let's play",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       'Questions:' +
//                           (response?.results?.toString() ??
//                               "Question Not available"),
//                       style: TextStyle(fontSize: 40),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget reward(String title, String data) {
//     return Container(
//       child: Column(
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 25,
//             ),
//           ),
//           Text(
//             data,
//             style: TextStyle(
//                 fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:quiz_app/model/category.dart';

// import 'quiz_screen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Quiz Categories'),
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(16),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//         ),
//         itemBuilder: (context, index) {
//           return CategoryCard(category: categories[index]);
//         },
//       ),
//     );
//   }
// }

// class CategoryCard extends StatelessWidget {
//   final Category category;

//   const CategoryCard({Key? key, required this.category}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => QuizScreen(category: category),
//           ),
//         );
//       },
//       child: Card(
//         elevation: 4,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               category.icon,
//               style: const TextStyle(fontSize: 48),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               category.name,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/provider/quiz_provider.dart';

import 'quiz_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Quiz App!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  ref.refresh(questionsProvider);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text(
                  'Start Quiz',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

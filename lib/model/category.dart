import 'package:quiz_app/model/questions.dart';

class Category {
  final String name;
  final String icon;
  final List<Question> questions;

  Category({
    required this.name,
    required this.icon,
    required this.questions,
  });
}

// lib/data/quiz_data.dart
final List<Category> categories = [
  Category(
    name: 'Science',
    icon: '🔬',
    questions: [
      Question(
        question: 'What is the chemical symbol for gold?',
        options: ['Au', 'Ag', 'Fe', 'Cu'],
        correctAnswerIndex: 0,
      ),
      Question(
        question: 'Which planet is known as the Red Planet?',
        options: ['Venus', 'Mars', 'Jupiter', 'Saturn'],
        correctAnswerIndex: 1,
      ),
      Question(
        question: 'What is the largest organ in the human body?',
        options: ['Heart', 'Brain', 'Liver', 'Skin'],
        correctAnswerIndex: 3,
      ),
      Question(
        question: 'Which gas do plants absorb from the atmosphere?',
        options: ['Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Hydrogen'],
        correctAnswerIndex: 2,
      ),
      Question(
        question: 'What is the speed of light in vacuum?',
        options: [
          '299,792 km/s',
          '199,792 km/s',
          '399,792 km/s',
          '499,792 km/s'
        ],
        correctAnswerIndex: 0,
      ),
    ],
  ),
  Category(
    name: 'History',
    icon: '📚',
    questions: [
      Question(
        question: 'Who was the first President of the United States?',
        options: [
          'John Adams',
          'Thomas Jefferson',
          'George Washington',
          'Benjamin Franklin'
        ],
        correctAnswerIndex: 2,
      ),
      Question(
        question: 'In which year did World War II end?',
        options: ['1943', '1944', '1945', '1946'],
        correctAnswerIndex: 2,
      ),
      Question(
        question: 'Which ancient civilization built the pyramids?',
        options: ['Romans', 'Greeks', 'Mayans', 'Egyptians'],
        correctAnswerIndex: 3,
      ),
      Question(
        question: 'Who painted the Mona Lisa?',
        options: ['Michelangelo', 'Leonardo da Vinci', 'Raphael', 'Donatello'],
        correctAnswerIndex: 1,
      ),
      Question(
        question: 'Which empire was founded by Genghis Khan?',
        options: [
          'Roman Empire',
          'Ottoman Empire',
          'Mongol Empire',
          'Persian Empire'
        ],
        correctAnswerIndex: 2,
      ),
    ],
  ),
  // Add more categories as needed
];

import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  List<String> _questions = [
    'Sun rises in?',
    'Question 2?',
    'Question 3?',
  ];
  List<List<String>> _answers = [
    ['East', 'West', 'North', 'South'],
    ['Answer 1', 'Answer 2', 'Answer 3', 'Answer 4'],
    ['Answer 1', 'Answer 2', 'Answer 3', 'Answer 4'],
  ];
  List<int> _correctAnswers = [0, 1, 2];
  int _score = 0;

  void _answerQuestion(int selectedIndex) {
    if (selectedIndex == _correctAnswers[_questionIndex]) {
      setState(() {
        _score++;
      });
    }
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        centerTitle: true,
      ),
      body: Center(
        child: _questionIndex < _questions.length
            ? QuizWidget(
                question: _questions[_questionIndex],
                answers: _answers[_questionIndex],
                answerQuestion: _answerQuestion,
              )
            : ResultWidget(score: _score),
      ),
    );
  }
}

class QuizWidget extends StatelessWidget {
  final String question;
  final List<String> answers;
  final Function(int) answerQuestion;

  QuizWidget({
    required this.question,
    required this.answers,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ...answers.asMap().entries.map((entry) {
          int index = entry.key;
          String answer = entry.value;
          return ElevatedButton(
            onPressed: () => answerQuestion(index),
            child: Text(answer),
          );
        }).toList(),
      ],
    );
  }
}

class ResultWidget extends StatelessWidget {
  final int score;

  ResultWidget({required this.score});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quiz Finished!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Your score: $score',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

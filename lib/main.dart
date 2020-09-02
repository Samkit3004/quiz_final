import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite Movie?',
      'answers': [
        {'text': '3 Idiots', 'score': 10},
        {'text': 'Race 3', 'score': 1},
        {'text': 'Kalank', 'score': 3},
        {'text': 'Kick', 'score': 2},
      ],
    },
    {
      'questionText': 'What\'s your favorite singer?',
      'answers': [
        {'text': 'Badshah', 'score': 3},
        {'text': 'Mukesh', 'score': 11},
        {'text': 'Darshan Raval', 'score': 7},
        {'text': 'Arijit Singh', 'score': 9},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

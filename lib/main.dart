import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';

import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answer': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ]
    },
    {
      'questionText': 'What\'s your favourite supe?',
      'answer': [
        {'text': 'porfessor X', 'score': 1},
        {'text': 'Thor', 'score': 1},
        {'text': 'DP', 'score': 1},
        {'text': 'Bobby Deol', 'score': 0},
      ]
    }
  ];
  var _questionIndex = 0;
  var _totatScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totatScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totatScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('we have more question');
    } else {
      print('no more question');
    }
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "My First App",
            textAlign: TextAlign.center,
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                _resetQuiz,
                _totatScore,
              ),
      ),
    );
  }
}

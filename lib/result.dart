import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final void Function() resetQuiz;
  Result(this.resetQuiz, this.resultScore);
  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You\'re Doing pretty great.Keep Going bud ';
    } else if (resultScore <= 12) {
      resultText = 'You\'re average';
    } else if (resultScore <= 16) {
      resultText = 'You\'re What!!!!';
    } else {
      resultText = 'You\'re Horrible';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text(
          resultPhrase,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        )),
        FlatButton(
          child: Text('Restart Quiz!!'),
          textColor: Colors.blue,
          onPressed: resetQuiz,
        ),
        Center(
          child: Text(resultScore.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}

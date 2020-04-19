import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What is yout faviorite color?",
      "answers": [
        {"text": "black", "score": 10},
        {"text": "blue", "score": 8},
        {"text": "red", "score": 5},
        {"text": "green", "score": 2}
      ]
    },
    {
      "questionText": "What is your faviorite animal?",
      "answers": [
        {"text": "Rabbit", "score": 10},
        {"text": "blue whale", "score": 8},
        {"text": "red panda", "score": 5},
        {"text": "Green snake", "score": 2},
      ]
    },
    {
      "questionText": "What is your faviorite person?",
      "answers": [
        {"text": "UK", "score": 10},
        {"text": "suk", "score": 8},
        {"text": "mus", "score": 5},
        {"text": "Xav", "score": 2},
      ]
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
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
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

import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]["questionText"]),
            ...(questions[_questionIndex]["answers"] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}

const questions = [
  {
    "questionText": "What is yout faviorite color?",
    "answers": ["black", "blue", "Green", "None of them"]
  },
  {
    "questionText": "What is your faviorite animal?",
    "answers": ["Rabbit", "blue whale", "Green snake", "None of them"]
  },
  {
    "questionText": "What is your faviorite person?",
    "answers": ["UK", "usk", "Xav", "None of them"]
  },
];

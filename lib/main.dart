import 'package:flutter/material.dart';
import 'package:web_app/quiz.dart';
import 'package:web_app/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = [
    {
      'questionText': 'Qual sua cor favorita?',
      'answer': [
        {'text': 'Preto', 'score': 2},
        {'text': 'Vermelho', 'score': 5},
        {'text': 'Verde', 'score': 15}
      ]
    },
    {
      'questionText': 'Qual seu animal favorito?',
      'answer': [
        {'text': 'Cobra', 'score': 2},
        {'text': 'Cavalo', 'score': 9},
        {'text': 'Girafa', 'score': 7}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;
    if (_questionIndex < questions.length) {
      print("Mais questões!");
    } else {
      print("Sem mais questões");
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
      print(_questionIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Meu primeiro App'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

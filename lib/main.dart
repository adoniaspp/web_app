import 'package:flutter/material.dart';
import './question.dart';
import 'answer.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion(){
    setState(() {
    _questionIndex = _questionIndex + 1;
    print(_questionIndex);
      
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'Qual sua cor favorita?',
        'answer': ['Preto', 'Vermelho', 'Verde']
      },
      {
        'questionText': 'Qual seu animal favorito?',
        'answer': ['Cobra', 'Cavalo', 'Girafa']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Meu primeiro App'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText'] as String),
            ...(questions[_questionIndex]['answer'] as List<String>).map((answer){
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}

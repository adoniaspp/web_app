import 'package:flutter/material.dart';
import 'package:web_app/question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {required this.answerQuestion,
      required this.questionIndex,
      required this.questions});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[questionIndex]['questionText'] as String),
      ...(questions[questionIndex]['answer'] as List<Map<String, Object>>).map((answer) {
        return Answer(() => answerQuestion(answer['score']), answer['text'] as String);
      }).toList()
    ]);
  }
}

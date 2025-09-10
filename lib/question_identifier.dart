import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget{
  const QuestionIdentifier({super.key,required this.questionIndex, required this.isCorrect});

  final int questionIndex;
  final bool isCorrect;

  @override
  Widget build(context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      margin: EdgeInsets.only(right:15),
      decoration: BoxDecoration(
        color: isCorrect ? const Color.fromARGB(224, 133, 248, 171) : Color.fromARGB(224, 249, 133, 156),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text(questionNumber.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(225,22, 2,56)),),
    );
  }
}
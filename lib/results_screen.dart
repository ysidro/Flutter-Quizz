import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScree extends StatelessWidget{
  const ResultsScree({super.key,required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;
  
  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++ ){
      summary.add({
        'question_index' : i,
        'question' : questions[i].text,
        'answers' : questions[i].answers[0],
        'user_answer' : chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();

    final numTotalQuestions = questions.length;
    
    final numCorrectQuestions = summaryData.where((data) => data['answers'] == data['user_answer'] ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',style:GoogleFonts.lato(color:Colors.white, fontSize: 20,fontWeight: FontWeight.w700),textAlign:TextAlign.center, ),
            SizedBox(height: 20),
            QuestionSummary(summaryData),
            SizedBox(height: 20),

            OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Color.fromARGB(255, 164, 255, 249), width: 1.5, ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),

            onPressed: onRestart,

            icon: const Icon(Icons.replay, size: 24),
            
            label: const Text('Restart Quiz'),
          )

          ],
        )
      ),
    );
  }
}
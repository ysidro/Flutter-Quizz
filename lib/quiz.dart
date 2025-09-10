import 'package:flutter/material.dart';

import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget{

  const Quiz({super.key});

  @override

  State<Quiz> createState(){

    return _QuizState();

  }

}

class _QuizState extends State<Quiz> {
  //Widget ? activeScreen;
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  //   // Any initialization logic can go here if needed
  // }
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  
  void switchScreen() {
    setState(() {
     // activeScreen = const QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }
  
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'results-screen';
        //selectedAnswers = [];
      });
      
    }
  }

  void onRestart(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }
  @override
  Widget build(context){

    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'questions-screen'){
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if(activeScreen == 'results-screen'){
      screenWidget = ResultsScree(chosenAnswers: selectedAnswers,onRestart:onRestart);
    }

    return MaterialApp(

      title: 'Quiz Demo App',

      theme: ThemeData(

        primarySwatch: Colors.blue,

      ),

      home: Scaffold(

        body: Center(

          child: Container(
  
      decoration: BoxDecoration(
  
        gradient: LinearGradient(
  
          colors: [          
            const Color.fromARGB(255, 45, 188, 133),
            const Color.fromARGB(255, 58, 181, 183),
            Colors.indigo],
  
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
  
        ),
  
      ),
  
       child: Center(
  
        child: screenWidget,
  
      ),
  
    ),

        ),

      ),

    );
  }
}
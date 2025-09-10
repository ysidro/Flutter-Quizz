import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;
  @override
  
  Widget build(context){
    
    return Column(
        
        mainAxisSize: MainAxisSize.min,
        
        children: [
          
          Image.asset('assets/images/quiz-logo.png', width: 220, color:  Color.fromARGB(255, 255, 255, 255),),
          const SizedBox(height: 80),

          Text('Learn Flutter the fun way!!', style: GoogleFonts.lato(fontSize: 20, color: const Color.fromRGBO(255, 255, 255, 1),fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
          
          const SizedBox(height: 20),
          
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white, width: 1.5, ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),

            onPressed: startQuiz,

            icon: const Icon(Icons.arrow_right_outlined, size: 24),
            
            label: const Text('Start Quiz'),
          )
        ],
      );
  }
}
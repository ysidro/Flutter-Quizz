import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;
  @override
  Widget build(context) {
    final isCorrect = itemData['answers'] == itemData['user_answer'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          
          QuestionIdentifier(
            questionIndex: itemData['question_index'] as int,
            isCorrect: isCorrect,
          ),
          
          Expanded(
            child: Column(
              children: [
                
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 220, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.start,
                ),

                SizedBox(height: 5),
                
                Text(
                  itemData['answers'] as String,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 207, 255, 140),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.start,
                ),
                
                Text(
                  itemData['user_answer'] as String,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 12, 39, 175),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
  
    );
  
  }
}

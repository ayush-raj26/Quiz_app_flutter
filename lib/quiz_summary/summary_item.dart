import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quiz_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int,
          ),
          const SizedBox(
            width: 25,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.pangolin(
                    color: const Color.fromARGB(255, 245, 214, 214),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Answer: ",
                      style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 200, 237, 158),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      itemData['user_answer'] as String,
                      style: GoogleFonts.openSans(
                          color: const Color.fromARGB(255, 128, 237, 244)),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Correct Answer: ",
                      style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 146, 187, 205),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      itemData['correct_answer'] as String,
                      style: GoogleFonts.montserrat(
                        color: const Color.fromARGB(255, 226, 249, 151),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

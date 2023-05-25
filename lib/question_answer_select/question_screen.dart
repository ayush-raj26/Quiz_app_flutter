import 'package:flutter/material.dart';
import 'package:quiz_app/question_answer_select/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    setState(() {
      widget.onSelectAnswer(selectedAnswer);
      currQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.pangolin(
                color: const Color.fromARGB(255, 236, 183, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Converting list of strings to list of widgets. // Map does not change the orginal button
            // The three dots at the start take each element and adds them to their children list
            // Overall we get a list of widgets
            // Shuffle does change the original list
            ...currentQuestion.getShuffledAnswers().map(
              (answers) {
                return AnswerButton(
                  answerText: answers,
                  onTap: () {
                    answerQuestion(answers);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

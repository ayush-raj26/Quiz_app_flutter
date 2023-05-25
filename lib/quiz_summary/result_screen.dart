import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz_summary/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.studentAnswers,
    required this.onRestart,
  });

  final List<String> studentAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < studentAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': studentAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $numCorrectQuestions out of $numTotalQuestions values correctly!',
            style: GoogleFonts.josefinSans(
              color: const Color.fromARGB(255, 225, 202, 238),
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionSummary(
            summaryData: getSummaryData(),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: onRestart,
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 213, 182, 245),
            ),
            icon: const Icon(Icons.refresh),
            label: const Text('RESTART QUIZ!'),
          ),
        ],
      ),
    );
  }
}

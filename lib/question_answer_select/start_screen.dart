import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartState extends StatelessWidget {
  const StartState(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(144, 195, 184, 241),
          ),

          // Opacity(
          //   opacity: 0.4,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(height: 30),
          Text(
            'Let\'s learn flutter the fun way!',
            style: GoogleFonts.shadowsIntoLight(
              color: const Color.fromARGB(255, 216, 183, 253),
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 221, 197, 248),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz!'),
          )
        ],
      ),
    );
  }
}

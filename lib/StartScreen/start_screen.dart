import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.openQuestionsScreen, {super.key});

  final void Function() openQuestionsScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
          const SizedBox(height: 75),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          OutlinedButton.icon(
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            onPressed: openQuestionsScreen,
            style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero)),
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/ResultScreen/answers_summary.dart';
import 'package:flutter_quiz_app/data/quiz_questions_data.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.selectedAnswers, required this.restartQuiz});

  final List<String> selectedAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        "question_index": i + 1,
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "user_answer": selectedAnswers[i],
        "correct": questions[i].answers[0] == selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Congratulations!',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'You answered ${getSummary().where((data) => data["correct"] == true).length} out of ${selectedAnswers.length} questions correctly!',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            AnswersSummary(summary: getSummary()),
            const SizedBox(height: 20),
            TextButton.icon(
              icon: const Icon(Icons.check, color: Colors.white),
              onPressed: restartQuiz,
              label: Text('Start again',
                  style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key,
      required this.answerText,
      required this.onTap,
      this.lastSelectedAnswer});

  final String answerText;
  final String? lastSelectedAnswer;
  final void Function(String answer) onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 30, 0, 75),
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        onTap(answerText);
      },
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: TextStyle(
            color:
                lastSelectedAnswer == answerText ? Colors.green : Colors.white),
      ),
    );
  }
}

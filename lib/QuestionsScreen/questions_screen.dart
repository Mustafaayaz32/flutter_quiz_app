import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/QuestionsScreen/answer_button.dart';
import 'package:flutter_quiz_app/data/quiz_questions_data.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(
      {super.key,
      required this.addSelectedAnswerToList,
      required this.getLastSelectedAnswerAndRemove});

  final void Function(String answer) addSelectedAnswerToList;
  final String Function() getLastSelectedAnswerAndRemove;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var answerIndex = 0;
  String? lastSelectedAnswer;

  void answerSelected(String answer) {
    setState(() {
      answerIndex++;
    });
    widget.addSelectedAnswerToList(answer);
  }

  void backButtonClicked() {
    if (answerIndex != 0) {
      setState(() {
        answerIndex--;
      });
      lastSelectedAnswer = widget.getLastSelectedAnswerAndRemove();
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[answerIndex];

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => backButtonClicked(),
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromARGB(200, 255, 255, 255),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // question text
                    Text(
                      currentQuestion.question,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        color: const Color.fromARGB(200, 255, 255, 255),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // answer buttons
                    ...currentQuestion.getShuffledAnswers().map((answer) =>
                        AnswerButton(
                            answerText: answer,
                            onTap: answerSelected,
                            lastSelectedAnswer: lastSelectedAnswer))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

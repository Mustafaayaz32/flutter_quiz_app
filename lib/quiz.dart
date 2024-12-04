import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/quiz_questions_data.dart';
import 'package:flutter_quiz_app/QuestionsScreen/questions_screen.dart';
import 'package:flutter_quiz_app/ResultScreen/result_screen.dart';
import 'package:flutter_quiz_app/StartScreen/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = StartScreen(changeScreen);
    super.initState();
  }

  void changeScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        addSelectedAnswerToList: addSelectedAnswerToList,
        getLastSelectedAnswerAndRemove: getLastSelectedAnswerAndRemove,
      );
    });
  }

  void addSelectedAnswerToList(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          selectedAnswers: selectedAnswers,
          restartQuiz: restartQuiz,
        );
      });
    }
  }

  String getLastSelectedAnswerAndRemove() {
    String lastSelectedAnswer = selectedAnswers.last;
    selectedAnswers.remove(lastSelectedAnswer);
    return lastSelectedAnswer;
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionsScreen(
          getLastSelectedAnswerAndRemove: getLastSelectedAnswerAndRemove,
          addSelectedAnswerToList: addSelectedAnswerToList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 71, 1, 138),
                  Color.fromARGB(255, 94, 1, 151)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: activeScreen),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(160, 255, 255, 255),
          ),
          const SizedBox(height: 75),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 25),
          OutlinedButton.icon(
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            onPressed: () {},
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

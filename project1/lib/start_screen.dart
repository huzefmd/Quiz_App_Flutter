// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 300,
            // color: Color.fromARGB(255, 99, 2, 23),
          ),
          // Opacity(
          //   // opacity: 0.5,
          //   child: Image.asset(
          //     'assets/images/naxi.webp',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            "learn flutter in a serios way !",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.grey[200],
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              "Start Quiz!",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

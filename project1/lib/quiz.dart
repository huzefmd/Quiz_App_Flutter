import 'package:flutter/material.dart';
import 'package:project1/data/questions.dart';
import 'package:project1/questions_screen.dart';
import 'package:project1/result_screen.dart';
import 'package:project1/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedanswers = [];
  var activescreen = "start-screen";

  
  void switchscreen() {
    setState(() {
      activescreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedanswers.add(answer);

    if (selectedanswers.length == questions.length) {
      setState(() {
        // selectedanswers = [];
        activescreen = 'result-screen';
      });
    }
  }
  void _restartQuiz() {
    setState(() {
      selectedanswers = [];
      activescreen = 'start-screen';  // Go back to start screen
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchscreen);
    if (activescreen == "questions-screen") {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activescreen == "result-screen") {
      screenWidget = ResultScreen(chooseAnswers:selectedanswers,
      onRestart: _restartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 33, 24, 163),
                  Color.fromARGB(255, 58, 20, 82),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget),
      ),
    );
  }
}

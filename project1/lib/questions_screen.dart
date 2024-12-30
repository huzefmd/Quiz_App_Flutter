// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/answer_button.dart';
import 'package:project1/data/questions.dart';
// import 'package:project1/models/quiz_questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedanswers) {
    // currentQuestionIndex=currentQuestionIndex+1;
    // currentQuestionIndex+=1;

    widget.onSelectAnswer(selectedanswers);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton
              (answerText: answer,
               onTap: (){
                answerQuestion(answer);
               }
               );
            })
          ],
        ),
      ),
    );
  }
}

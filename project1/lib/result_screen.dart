import 'package:flutter/material.dart';
import 'package:project1/data/questions.dart';
import 'package:project1/question_summary.dart';
// import 'package:project1/start_screen.dart';

// import 'package:flutter/widgets.dart';
class ResultScreen extends StatelessWidget {
  

  const ResultScreen({
    super.key,
    required this.chooseAnswers,
    required this.onRestart,
  });
  final List<String> chooseAnswers;
  final VoidCallback onRestart;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chooseAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chooseAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summarydata.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You Answered  $numCorrectQuestion out of $numTotalQuestion Questions  Correctly!!!!!",
                style: const TextStyle(color: Colors.white)),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: onRestart,
              style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.grey[200],
            ),
              child: const Row(
                mainAxisSize:
                    MainAxisSize.min, // Makes the button size fit its content
                children: [
                  Icon(
                    Icons.refresh, // The refresh icon
                    color: Color.fromARGB(255, 199, 7, 7), // Icon color
                  ),
                  SizedBox(width: 8), // Space between icon and text
                  Text(
                    "Restart Quiz",
                    style: TextStyle(
                      color: Color.fromARGB(255, 199, 7, 7), // Text color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


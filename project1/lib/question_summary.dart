import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Padding(
                     padding: const EdgeInsets.only(bottom: 50.0,right: 20.0),
                     
                    child: CircleAvatar(
                      radius: 16,
                        backgroundColor: const Color.fromARGB(255, 233, 34, 223),
                      
                      child: Text(((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(color: Color.fromARGB(255, 254, 253, 253))),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(data['question'] as String,
                            style: const TextStyle(color: Colors.white)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data["user_answer"] as String,
                            style: const TextStyle(color: Color.fromARGB(255, 250, 4, 4))),
                        Text(data["correct_answer"] as String,
                            style: const TextStyle(color: Color.fromARGB(255, 2, 235, 52))),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

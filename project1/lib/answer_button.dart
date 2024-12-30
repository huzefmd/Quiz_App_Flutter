// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:project1/questions_screen.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this .onTap,
  });
  final String answerText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
        backgroundColor:const Color.fromARGB(255, 82, 143, 194),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
      ),
      child:  Text(answerText),
    );
  }
}

import 'package:anti_cheat_exam_app/stores/exam/exam_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionButton extends StatelessWidget {
  final int questionNo;

  QuestionButton({required this.questionNo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ExamStore>().goToQuestion(questionNo);
      },
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueAccent,
        ),
        alignment: Alignment.center,
        child: Text(
          "${questionNo + 1}",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

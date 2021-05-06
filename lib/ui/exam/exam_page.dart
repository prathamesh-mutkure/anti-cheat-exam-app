import 'package:anti_cheat_exam_app/models/exam/Exam.dart';
import 'package:anti_cheat_exam_app/stores/exam/exam_store.dart';
import 'package:anti_cheat_exam_app/widgets/exam/exam_buttons.dart';
import 'package:anti_cheat_exam_app/widgets/exam/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  Exam? exam;
  int? currentQuestion;

  @override
  Widget build(BuildContext context) {
    exam = context.watch<ExamStore>().currentExam;

    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              QuestionWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ExamButton(
                    text: "PREVIOUS",
                    onPressed: () {
                      context.read<ExamStore>().goToPreviousQuestion();
                    },
                  ),
                  SizedBox(width: 20),
                  ExamButton(
                    text: "NEXT",
                    onPressed: () {
                      context.read<ExamStore>().goToNextQuestion();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(exam!.name),
    );
  }
}

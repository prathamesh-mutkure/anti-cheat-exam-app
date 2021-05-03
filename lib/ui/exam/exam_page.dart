import 'package:anti_cheat_exam_app/models/exam/Exam.dart';
import 'package:anti_cheat_exam_app/widgets/exam/question_widget.dart';
import 'package:flutter/material.dart';

class ExamPage extends StatefulWidget {
  final Exam exam;

  ExamPage({@required this.exam});

  @override
  _ExamPageState createState() => _ExamPageState(exam: exam);
}

class _ExamPageState extends State<ExamPage> {
  final Exam exam;

  _ExamPageState({@required this.exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ..._buildQuestionWidgets(),
            ],
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(exam.name),
    );
  }

  List<Widget> _buildQuestionWidgets() {
    return exam.questions
        .map((question) => QuestionWidget(question: question))
        .toList();
  }
}

import 'package:anti_cheat_exam_app/constants/routes.dart';
import 'package:anti_cheat_exam_app/models/exam/Exam.dart';
import 'package:anti_cheat_exam_app/stores/exam/assigned_exam_store.dart';
import 'package:anti_cheat_exam_app/stores/student/student_store.dart';
import 'package:anti_cheat_exam_app/widgets/home/exam_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  logout(BuildContext context) {
    context.read<StudentStore>().logout();
    Navigator.pushReplacementNamed(context, Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            children: [
              _buildExamCards(context),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(context) {
    return AppBar(
      title: Text("Welcome"),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () => logout(context),
        )
      ],
    );
  }

  Widget _buildExamCards(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          children: context
              .watch<AssignedExamStore>()
              .assignedExams
              .map((Exam exam) => ExamCard(exam: exam))
              .toList(),
        );
      },
    );
  }
}

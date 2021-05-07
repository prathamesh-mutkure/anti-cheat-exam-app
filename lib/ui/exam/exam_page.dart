import 'package:anti_cheat_exam_app/models/exam/Exam.dart';
import 'package:anti_cheat_exam_app/stores/exam/exam_store.dart';
import 'package:anti_cheat_exam_app/widgets/exam/exam_buttons.dart';
import 'package:anti_cheat_exam_app/widgets/exam/exam_warning_alert.dart';
import 'package:anti_cheat_exam_app/widgets/exam/question_button.dart';
import 'package:anti_cheat_exam_app/widgets/exam/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> with WidgetsBindingObserver {
  Exam? exam;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed &&
        !context.read<ExamStore>().didLeaveExam) {
      context.read<ExamStore>().didLeaveExam = true;

      // TODO: Set barrierDismissible false
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => ExamWarningAlert(),
      ).then((value) {
        context.read<ExamStore>().didLeaveExam = false;
        ++context.read<ExamStore>().leaveExamCount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    exam = context.watch<ExamStore>().currentExam;

    // TODO: Set onWillPop false
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
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
                SizedBox(height: 50),
                _buildQuestionButtons(),
              ],
            ),
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

  _buildQuestionButtons() {
    return GridView.count(
      crossAxisCount: 5,
      shrinkWrap: true,
      padding: EdgeInsets.all(2),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      physics: NeverScrollableScrollPhysics(),
      children: () {
        List<Widget> widgets = [];

        for (int i = 0; i < exam!.questions.length; i++) {
          widgets.add(QuestionButton(questionNo: i));
        }

        return widgets;
      }(),
    );
  }
}

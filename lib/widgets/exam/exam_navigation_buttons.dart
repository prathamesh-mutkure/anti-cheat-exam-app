import 'package:anti_cheat_exam_app/stores/exam/exam_store.dart';
import 'package:anti_cheat_exam_app/stores/student/student_store.dart';
import 'package:anti_cheat_exam_app/widgets/exam/exam_buttons.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ExamNavigationButtons extends StatelessWidget {
  final Function onAI;

  ExamNavigationButtons({required this.onAI});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ExamButton(
          text: "PREVIOUS",
          onPressed: () {
            context.read<ExamStore>().goToPreviousQuestion();
          },
        ),
        SizedBox(width: 20),
        Observer(
          builder: (context) {
            return context.watch<ExamStore>().isLastQuestion
                ? ExamButton(
                    text: "END EXAM",
                    color: Colors.red,
                    onPressed: () async {
                      // AlertDialog();

                      bool confirmEnd = await confirm(
                        context,
                        title: Text('WARNING'),
                        content: Text(
                            'You exited the exam 3 times and suspicious behavior was detected 1 times?'),
                        textOK: Text(
                          'END',
                          style: TextStyle(color: Colors.red),
                        ),
                        textCancel: Text('CANCEL'),
                      );

                      if (confirmEnd) {
                        String studentId =
                            context.read<StudentStore>().currentStudent!.id;
                        context.read<ExamStore>().endExam(context, studentId);
                      }
                    },
                  )
                : ExamButton(
                    text: "NEXT",
                    onPressed: () {
                      context.read<ExamStore>().goToNextQuestion();
                    },
                  );
          },
        ),
        // TODO: For Testing, remove during actual app
        SizedBox(width: 20),
        ExamButton(
          text: "AI",
          onPressed: () {
            onAI();
          },
        ),
      ],
    );
  }
}

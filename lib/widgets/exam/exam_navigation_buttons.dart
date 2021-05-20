import 'package:anti_cheat_exam_app/stores/exam/exam_store.dart';
import 'package:anti_cheat_exam_app/widgets/exam/exam_buttons.dart';
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
                    onPressed: () {
                      context.read<ExamStore>().endExam();
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

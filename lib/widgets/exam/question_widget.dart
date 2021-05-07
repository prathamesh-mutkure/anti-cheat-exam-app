import 'package:anti_cheat_exam_app/models/exam/Question.dart';
import 'package:anti_cheat_exam_app/stores/exam/exam_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class QuestionWidget extends StatefulWidget {
  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Observer(
          builder: (context) {
            int currentQuesNo = context.watch<ExamStore>().currentQuestionNo;
            Question? currentQues = context.watch<ExamStore>().currentQuestion;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Question ${currentQuesNo + 1}: '),
                Text(currentQues!.title),
                ..._buildOptions(currentQues, currentQuesNo, context),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildOptions(
    Question question,
    int currentQues,
    BuildContext context,
  ) {
    List<Widget> optionList = [];

    question.options.forEach((key, value) {
      optionList.add(
        RadioListTile(
          value: key,
          title: Text(value),
          groupValue: context.watch<ExamStore>().answers![currentQues],
          onChanged: (String? val) {
            context.read<ExamStore>().setAnswer(currentQues, val);
          },
        ),
      );
    });

    return optionList;
  }
}

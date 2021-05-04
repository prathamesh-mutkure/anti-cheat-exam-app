import 'package:anti_cheat_exam_app/models/exam/Question.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  final Question question;
  final int questionNo;

  QuestionWidget({
    @required this.question,
    @required this.questionNo,
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState(
        question: question,
        questionNo: questionNo,
      );
}

class _QuestionWidgetState extends State<QuestionWidget> {
  final Question question;
  final int questionNo;
  String chosenOptionKey;

  _QuestionWidgetState({
    @required this.question,
    @required this.questionNo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Question $questionNo: '),
            Text(question.title),
            ..._buildOptions(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOptions() {
    List<Widget> optionList = [];

    question.options.forEach((key, value) {
      optionList.add(
        RadioListTile(
          value: key,
          title: Text(value),
          groupValue: chosenOptionKey,
          onChanged: (val) {
            setState(() => chosenOptionKey = val);
          },
        ),
      );
    });

    return optionList;
  }
}

import 'package:anti_cheat_exam_app/models/exam/Question.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  final Question question;

  QuestionWidget({@required this.question});

  @override
  _QuestionWidgetState createState() =>
      _QuestionWidgetState(question: question);
}

class _QuestionWidgetState extends State<QuestionWidget> {
  final Question question;
  String chosenOptionKey;

  _QuestionWidgetState({@required this.question});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Question 1: '),
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

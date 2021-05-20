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
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      elevation: 0.0,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Observer(
          builder: (context) {
            int currentQuesNo = context.watch<ExamStore>().currentQuestionNo;
            Question? currentQues = context.watch<ExamStore>().currentQuestion;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${currentQuesNo + 1}:  ',
                      style: TextStyle(
                        fontFamily: "assets/fonts/Roboto-Medium.ttf",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff636e72),
                      ),
                    ),
                    Text(
                      currentQues!.title,
                      style: TextStyle(
                        fontFamily: "assets/fonts/Roboto-Medium.ttf",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff636e72),
                      ),
                    ),
                  ],
                ),
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
          title: Text(
            value,
            style: TextStyle(
              fontFamily: "assets/fonts/Roboto-Medium.ttf",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff636e72),
            ),
          ),
          activeColor: Colors.blueGrey,
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

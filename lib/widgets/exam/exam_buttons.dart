import 'package:anti_cheat_exam_app/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';

class ExamButton extends StatelessWidget {
  final text;
  final Function onPressed;

  ExamButton({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RoundedButtonWidget(
      buttonText: text,
      onPressed: onPressed,
      buttonColor: Colors.blueAccent,
    );
  }
}

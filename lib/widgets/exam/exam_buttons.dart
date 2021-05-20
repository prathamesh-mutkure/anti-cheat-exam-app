import 'package:anti_cheat_exam_app/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';

class ExamButton extends StatelessWidget {
  final text;
  final void Function() onPressed;
  final Color color;

  ExamButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedButtonWidget(
      buttonText: text,
      onPressed: onPressed,
      buttonColor: color,
    );
  }
}

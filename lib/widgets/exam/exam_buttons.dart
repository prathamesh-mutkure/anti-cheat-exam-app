import 'package:flutter/material.dart';

class ExamButton extends StatelessWidget {
  final text;
  final void Function() onPressed;

  ExamButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "assets/fonts/Roboto-Medium.ttf",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

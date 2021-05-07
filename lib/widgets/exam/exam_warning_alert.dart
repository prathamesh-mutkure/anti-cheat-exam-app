import 'package:flutter/material.dart';

class ExamWarningAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "WARNING",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        "Multiple attempts to leave exam may flagged as cheating!",
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("OK"),
        ),
      ],
    );
  }
}

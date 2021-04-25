import 'package:flutter/material.dart';

class Question {
  final String title;
  final Map<String, String> options;

  Question({
    @required this.title,
    @required this.options,
  });

  factory Question.getDummyQuestion() {
    return Question(
      title: "What is the sum of a and b",
      options: {
        'A': 'a+b',
        'B': 'ab',
        'C': 'ba',
        'D': 'None of the Above',
      },
    );
  }
}

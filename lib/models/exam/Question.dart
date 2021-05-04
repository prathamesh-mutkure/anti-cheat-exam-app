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
      title: "1. What is the sum of a and b",
      options: {
        'A': 'a+b',
        'B': 'ab',
        'C': 'ba',
        'D': 'None of the Above',
      },
    );
  }

  factory Question.getDummyQuestion2() {
    return Question(
      title: "2. What is the sum of a and b",
      options: {
        'A': 'a+b',
        'B': 'ab',
        'C': 'ba',
        'D': 'None of the Above',
      },
    );
  }
}

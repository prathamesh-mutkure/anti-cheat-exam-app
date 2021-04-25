import 'package:flutter/material.dart';

class Question {
  final String title;
  final Map<String, String> options;

  Question({
    @required this.title,
    @required this.options,
  });
}

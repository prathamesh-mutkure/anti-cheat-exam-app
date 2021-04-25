import 'package:anti_cheat_exam_app/models/exam/Question.dart';
import 'package:flutter/material.dart';

class Exam {
  final String code;
  final String name;
  final DateTime dateTime;
  final List<Question> questions;

  Exam({
    @required this.code,
    @required this.name,
    @required this.dateTime,
    @required this.questions,
  });
}

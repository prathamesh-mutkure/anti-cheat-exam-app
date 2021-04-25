import 'package:anti_cheat_exam_app/models/exam/Exam.dart';
import 'package:flutter/material.dart';

class Student {
  String name;
  String id;
  List<Exam> assignedExams;

  Student({
    @required this.id,
    @required this.name,
    this.assignedExams,
  });

  factory Student.getDummyStudent() {
    return Student(
      id: '1800760300',
      name: 'John Doe',
      assignedExams: [
        Exam.getDummyExam(),
        Exam.getDummyExam(),
        Exam.getDummyExam(),
      ],
    );
  }
}

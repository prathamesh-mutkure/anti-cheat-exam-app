import 'dart:convert';

import 'package:anti_cheat_exam_app/models/exam/Exam.dart';

class Student {
  String id;
  String fname;
  String lname;
  String token;
  List<dynamic>? assignedExams;

  Student({
    required this.id,
    required this.fname,
    required this.lname,
    required this.token,
    this.assignedExams,
  });

  factory Student.getDummyStudent() {
    return Student(
      id: '1800760300',
      fname: 'John',
      lname: 'Doe',
      token: "token",
      assignedExams: [
        Exam.getDummyExam(),
        Exam.getDummyExam(),
        Exam.getDummyExam(),
      ],
    );
  }

  factory Student.fromJson(var json) {
    return Student(
      id: json['id'],
      fname: json['fname'],
      lname: json['lname'],
      token: json['token'],
      assignedExams: json['assignedExams'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'fname': fname,
        'lname': lname,
        'token': token,
        'assignedExams': jsonEncode(assignedExams),
      };
}

import 'package:anti_cheat_exam_app/models/exam/Question.dart';

class Exam {
  final String id;
  final String name;
  final DateTime dateTime;
  List<Question>? questions;
  List<String>? answerKeys;

  Exam({
    required this.id,
    required this.name,
    required this.dateTime,
    this.questions,
    this.answerKeys,
  });

  factory Exam.getDummyExam() {
    return Exam(
      id: "12345",
      name: "Maths",
      dateTime: new DateTime.now(),
      questions: [
        Question.getDummyQuestion(),
        Question.getDummyQuestion2(),
        Question.getDummyQuestion(),
      ],
      answerKeys: ['A', 'B', 'C'],
    );
  }

  factory Exam.fromJson(json) {
    return Exam(
      id: json['_id'],
      name: json['name'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }
}

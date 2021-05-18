import 'package:anti_cheat_exam_app/models/exam/Question.dart';

class Exam {
  final String id;
  final String name;
  final DateTime dateTime;
  final List<Question> questions;
  final List<String> answerKeys;

  Exam({
    required this.id,
    required this.name,
    required this.dateTime,
    required this.questions,
    required this.answerKeys,
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
    List<Question> questions = [];

    json['questions']
        .forEach((question) => questions.add(Question.fromJson(question)));

    return Exam(
      id: json['id'],
      name: json['name'],
      dateTime: json['dateTime'],
      questions: questions,
      answerKeys: json['answerKeys'],
    );
  }
}

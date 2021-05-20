import 'package:anti_cheat_exam_app/models/exam/Question.dart';

class Exam {
  final String id;
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final Duration duration;
  final int questionCount;
  List<Question>? questions;
  List<String>? answerKeys;
  String? status;

  Exam({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.duration,
    required this.questionCount,
    this.questions,
    this.answerKeys,
    this.status,
  });

  factory Exam.getDummyExam() {
    return Exam(
      id: "12345",
      name: "Maths",
      startDate: new DateTime.now(),
      endDate: new DateTime.now(),
      duration: Duration(seconds: 3600),
      questionCount: 3,
      questions: [
        Question.getDummyQuestion(),
        Question.getDummyQuestion2(),
        Question.getDummyQuestion(),
      ],
      answerKeys: ['A', 'B', 'C'],
      status: "pending",
    );
  }

  factory Exam.fromJson(json) {
    List<Question> questions = [];

    if (json['questions'] != null) {
      json['questions']
          .forEach((question) => questions.add(Question.fromJson(question)));
    }

    return Exam(
      id: json['_id'],
      name: json['name'],
      startDate: DateTime.parse(json['startDate']).toLocal(),
      endDate: DateTime.parse(json['endDate']).toLocal(),
      duration: Duration(seconds: json['duration']),
      questionCount: json['questionCount'],
      questions: questions,
      answerKeys: json?['answerKeys'],
      status: json?['status'],
    );
  }
}

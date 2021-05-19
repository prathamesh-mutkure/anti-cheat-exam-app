import 'package:anti_cheat_exam_app/models/exam/Exam.dart';

class Student {
  String id;
  String fname;
  String lname;
  List<Exam>? assignedExams;

  Student({
    required this.id,
    required this.fname,
    required this.lname,
    this.assignedExams,
  });

  factory Student.getDummyStudent() {
    return Student(
      id: '1800760300',
      fname: 'John',
      lname: 'Doe',
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
      assignedExams: [
        Exam.getDummyExam(),
        Exam.getDummyExam(),
        Exam.getDummyExam(),
      ],
    );
  }
}

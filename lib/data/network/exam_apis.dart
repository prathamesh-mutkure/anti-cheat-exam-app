import 'dart:convert';

import 'package:anti_cheat_exam_app/data/network/api_constants.dart';
import 'package:anti_cheat_exam_app/models/exam/Exam.dart';
import 'package:http/http.dart' as http;

class ExamApi {
  static Future<Exam> getExam(String examId) async {
    var url = Uri.parse(Endpoints.getExam(examId));
    http.Response response = await http.get(url);

    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse);

    if (jsonResponse['err'] != null) {
      throw jsonResponse['err'];
    } else {
      return Exam.fromJson(jsonResponse);
    }
  }

  static Future<List<Exam>> getAssignedExams(String studentId) async {
    var url = Uri.parse(Endpoints.getAssignedExam(studentId));
    http.Response response = await http.get(url);

    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse['err'] != null) {
      throw jsonResponse['err'];
    } else {
      var exams = jsonResponse["exams"];
      List<Exam> examList = [];

      exams.forEach((exam) => examList.add(Exam.fromJson(exam)));

      return examList;
    }
  }
}

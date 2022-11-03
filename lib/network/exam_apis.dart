import 'dart:convert';
import 'dart:io';

import 'package:anti_cheat_exam_app/constants/api_endpoints.dart';
import 'package:anti_cheat_exam_app/models/exam/Exam.dart';
import 'package:http/http.dart' as http;

class ExamApi {
  static Future<Exam> getExam(
    String examId,
    String studentId,
    String token,
  ) async {
    var url = Uri.parse(APIEndpoints.getExam(studentId, examId));
    http.Response response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
    });

    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse['err'] != null) {
      throw jsonResponse['err'];
    } else {
      return Exam.fromJson(jsonResponse);
    }
  }

  static Future<List<Exam>> getAssignedExams(
    String studentId,
    String token,
  ) async {
    var url = Uri.parse(APIEndpoints.getAssignedExam(studentId));
    http.Response response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
    });

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

  static Future<bool> submitExam(
    String studentId,
    String examId,
    List<String?> answers,
    String token,
  ) async {
    var url = Uri.parse(APIEndpoints.getSubmitExam(studentId));

    http.Response response = await http.post(
      url,
      body: jsonEncode({"examId": examId, "answers": answers}),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token"
      },
    );

    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse['err'] != null) {
      print("ERR:" + jsonResponse['err']);
      throw jsonResponse['err'];
    } else {
      return true;
    }
  }
}

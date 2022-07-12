import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIEndpoints {
  APIEndpoints._();

  static final String baseUrl = dotenv.env['BACKEND_URL'] ?? "";

  // Auth
  static final String login = "$baseUrl/login";

  // Exam
  static String getExam(String examId) => '$baseUrl/exam/$examId';

  static String getAssignedExam(String studentId) =>
      '$baseUrl/$studentId/assignedExams/all';

  static String getSubmitExam(String studentId) =>
      '$baseUrl/submitExam/$studentId/';

  static const Map<String, String> postHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
}

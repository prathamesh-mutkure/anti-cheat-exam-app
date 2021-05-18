class Endpoints {
  static const String baseUrl = "http://localhost:8000/api";

  static const String login = "$baseUrl/login";

  static String getExam(String examId) => '$baseUrl/exam/$examId';

  static String getAssignedExam(String studentId) =>
      '$baseUrl/$studentId/assignedExams/all';

  static const Map<String, String> postHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
}

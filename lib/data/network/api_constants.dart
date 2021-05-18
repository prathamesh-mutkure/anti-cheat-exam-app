class Endpoints {
  static const String baseUrl = "http://localhost:8000/api";

  static const String login = "/login";

  static String getExam(String examId) => '$baseUrl/exam/$examId';

  static String getAssignedExam(String studentId) =>
      '$baseUrl/$studentId/assignedExams/all';
}

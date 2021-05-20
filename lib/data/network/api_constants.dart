class Endpoints {
  static const String baseUrl =
      "https://anit-cheat-app-backend.herokuapp.com/api";

  static const String login = "$baseUrl/login";

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

class Endpoints {
  // static const String baseUrl = "http://10.0.2.2:8000/api";
  // 10.0.2.2

  Endpoints._();

  static const RUNTIME_ENV =
      String.fromEnvironment('ENV', defaultValue: 'LOCAL');

  static const String baseUrl = RUNTIME_ENV == "LOCAL"
      ? String.fromEnvironment('LOCAL',
          defaultValue: 'http://10.0.2.2:8000/api')
      : String.fromEnvironment('SERVER', defaultValue: '');

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

import 'dart:convert';

import 'package:anti_cheat_exam_app/constants/api_endpoints.dart';
import 'package:anti_cheat_exam_app/models/student/Student.dart';
import 'package:http/http.dart' as http;

class StudentApi {
  static Future<Student> login(String id, String password) async {
    var url = Uri.parse(APIEndpoints.login);

    http.Response response = await http.post(
      url,
      body: jsonEncode({"id": id, "password": password}),
      headers: APIEndpoints.postHeaders,
    );

    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse['err'] != null) {
      throw jsonResponse['err'];
    } else {
      return Student.fromJson(jsonResponse);
    }
  }
}

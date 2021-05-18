import 'package:anti_cheat_exam_app/data/network/student_apis.dart';
import 'package:anti_cheat_exam_app/models/Student.dart';
import 'package:anti_cheat_exam_app/routes.dart';
import 'package:anti_cheat_exam_app/stores/exam/assigned_exam_store.dart';
import 'package:anti_cheat_exam_app/stores/student/student_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _loginPressed(BuildContext context) async {
    try {
      Student student = await StudentApi.login(
        _idController.text,
        _passwordController.text,
      );
      StudentStore().login(student);
      context.read<AssignedExamStore>().getAssignedExams(student.id);
      Navigator.pushReplacementNamed(context, Routes.home);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    _idController.text = "1800760308";
    _passwordController.text = "12345678";

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                right: 25.0,
                bottom: 10.0,
              ),
              child: TextField(
                controller: _idController,
                decoration: InputDecoration(
                  hintText: "Login ID",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () => _loginPressed(context),
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

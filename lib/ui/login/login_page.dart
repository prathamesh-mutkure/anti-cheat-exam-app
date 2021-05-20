import 'package:anti_cheat_exam_app/data/network/student_apis.dart';
import 'package:anti_cheat_exam_app/models/Student.dart';
import 'package:anti_cheat_exam_app/routes.dart';
import 'package:anti_cheat_exam_app/stores/exam/assigned_exam_store.dart';
import 'package:anti_cheat_exam_app/stores/student/student_store.dart';
import 'package:anti_cheat_exam_app/utils/app/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _loginPressed(BuildContext context) async {
    try {
      AppUtils.showLoading("Logging in..");
      Student student = await StudentApi.login(
        _idController.text,
        _passwordController.text,
      );
      context.read<StudentStore>().login(student);
      context.read<AssignedExamStore>().getAssignedExams(student.id);
      AppUtils.dismissLoading();
      Navigator.pushReplacementNamed(context, Routes.home);
    } catch (e) {
      AppUtils.dismissLoading();
      AppUtils.showToast(e.toString());
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
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
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    scale: 3,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "ANTI CHEAT",
                    style: TextStyle(
                      fontFamily: "assets/fonts/Roboto-Medium.ttf",
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff34656d),
                    ),
                  )
                ],
              ),
            ),
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
                  color: Color(0xffa7bbc7),
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

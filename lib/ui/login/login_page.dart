import 'package:anti_cheat_exam_app/constants/routes.dart';
import 'package:anti_cheat_exam_app/constants/strings.dart';
import 'package:anti_cheat_exam_app/data/network/student_apis.dart';
import 'package:anti_cheat_exam_app/models/Student.dart';
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
  bool isIdValid = true;
  bool isPasswordValid = true;

  _validateInputFields() {
    setState(() {
      isIdValid = _idController.text.length == 10;
      isPasswordValid = _passwordController.text.length >= 8;
    });
  }

  _loginPressed(BuildContext context) async {
    _validateInputFields();

    if (!isIdValid || !isPasswordValid) {
      return;
    }

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
                    key: Key("login_logo"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "ANTI CHEAT EXAM APP",
                    style: TextStyle(
                      fontFamily: "assets/fonts/Roboto-Medium.ttf",
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff34656d),
                    ),
                    key: Key("login_app_name"),
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
                key: Key(Strings.idFieldKey),
                controller: _idController,
                decoration: InputDecoration(
                  hintText: Strings.idFieldHint,
                  errorText: isIdValid ? null : Strings.idFieldError,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: TextField(
                key: Key(Strings.passwordFieldKey),
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: Strings.passwordFieldHint,
                  errorText:
                      isPasswordValid ? null : Strings.passwordFieldError,
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () => _loginPressed(context),
              key: Key(Strings.loginButtonKey),
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xffa7bbc7),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    Strings.loginButtonText,
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

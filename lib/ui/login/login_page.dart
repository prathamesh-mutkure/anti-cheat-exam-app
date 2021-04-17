import 'package:anti_cheat_exam_app/routes.dart';
import 'package:anti_cheat_exam_app/stores/student/student_store.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  _loginPresses(context) {
    StudentStore().login();
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Login ID",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => _loginPresses(context),
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}

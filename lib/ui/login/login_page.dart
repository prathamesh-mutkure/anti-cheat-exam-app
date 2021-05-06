import 'package:anti_cheat_exam_app/routes.dart';
import 'package:anti_cheat_exam_app/stores/student/student_store.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  _loginPresses(context) {
    StudentStore().login();
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Login ID",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () => _loginPresses(context),
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
    ));
  }
}

// Container(
// padding: EdgeInsets.symmetric(horizontal: 10),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// TextField(
// decoration: InputDecoration(
// hintText: "Login ID",
// ),
// ),
// TextField(
// decoration: InputDecoration(
// hintText: "Password",
// ),
// ),
// SizedBox(height: 20),
// TextButton(
// onPressed: () => _loginPresses(context),
// child: Text("Login"),
// )
// ],
// ),
// ),

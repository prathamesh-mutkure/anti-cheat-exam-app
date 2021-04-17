import 'dart:developer';

import 'package:anti_cheat_exam_app/routes.dart';
import 'package:anti_cheat_exam_app/stores/student/student_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home"),
            TextButton(
              onPressed: () {
                context.read<StudentStore>().logout();
                Navigator.pushReplacementNamed(context, Routes.login);
              },
              child: Text("Logout"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                elevation: MaterialStateProperty.all(1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

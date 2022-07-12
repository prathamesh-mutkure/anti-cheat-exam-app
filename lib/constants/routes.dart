import 'package:anti_cheat_exam_app/pages/exam_page.dart';
import 'package:anti_cheat_exam_app/pages/home_page.dart';
import 'package:anti_cheat_exam_app/pages/login_page.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String exam = '/exam';

  static final routes = <String, WidgetBuilder>{
    // splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginPage(),
    home: (BuildContext context) => HomePage(),
    exam: (BuildContext context) => ExamPage(),
  };
}

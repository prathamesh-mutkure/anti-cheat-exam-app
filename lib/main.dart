import 'package:anti_cheat_exam_app/constants/strings.dart';
import 'package:anti_cheat_exam_app/routes.dart';
import 'package:anti_cheat_exam_app/stores/exam/exam_store.dart';
import 'package:anti_cheat_exam_app/stores/student/student_store.dart';
import 'package:anti_cheat_exam_app/ui/home/home_page.dart';
import 'package:anti_cheat_exam_app/ui/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final StudentStore _studentStore = StudentStore();
  final ExamStore _examStore = ExamStore();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => _studentStore),
        Provider(create: (_) => _examStore),
      ],
      child: MaterialApp(
        title: Strings.appName,
        routes: Routes.routes,
        debugShowCheckedModeBanner: false,
        home: _studentStore.isLoggedIn ? HomePage() : LoginPage(),
      ),
    );
  }
}

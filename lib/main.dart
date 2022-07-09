import 'package:anti_cheat_exam_app/constants/routes.dart';
import 'package:anti_cheat_exam_app/constants/strings.dart';
import 'package:anti_cheat_exam_app/stores/exam/assigned_exam_store.dart';
import 'package:anti_cheat_exam_app/stores/exam/exam_store.dart';
import 'package:anti_cheat_exam_app/stores/student/student_store.dart';
import 'package:anti_cheat_exam_app/ui/home/home_page.dart';
import 'package:anti_cheat_exam_app/ui/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  final AssignedExamStore _assignedExamStore = AssignedExamStore();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => _studentStore),
        Provider(create: (_) => _examStore),
        Provider(create: (_) => _assignedExamStore),
      ],
      child: MaterialApp(
        title: Strings.appName,
        routes: Routes.routes,
        debugShowCheckedModeBanner: false,
        home: _studentStore.isLoggedIn ? HomePage() : LoginPage(),
        builder: EasyLoading.init(),
      ),
    );
  }
}

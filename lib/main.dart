import 'package:anti_cheat_exam_app/constants/strings.dart';
import 'package:anti_cheat_exam_app/routes.dart';
import 'package:anti_cheat_exam_app/stores/student/student_store.dart';
import 'package:anti_cheat_exam_app/widgets/empty_app_bar_widget.dart';
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
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => StudentStore()),
      ],
      child: MaterialApp(
        title: Strings.appName,
        routes: Routes.routes,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: EmptyAppBar(),
          body: Center(
            child: Text("Hello World"),
          ),
        ),
      ),
    );
  }
}

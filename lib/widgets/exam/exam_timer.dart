import 'package:anti_cheat_exam_app/stores/exam/exam_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ExamTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 10),
      child: Countdown(
        seconds: 60 * 30,
        build: (context, val) {
          int minutes = val ~/ 60;
          int secs = (val % 60).toInt();
          return Text(
            '$minutes:$secs',
            style: TextStyle(
              fontFamily: "assets/fonts/Roboto-Medium.ttf",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          );
        },
        controller: context.watch<ExamStore>().countdownController,
      ),
    );
  }
}

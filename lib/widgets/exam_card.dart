import 'package:anti_cheat_exam_app/models/exam/Exam.dart';
import 'package:anti_cheat_exam_app/stores/exam/exam_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  ExamCard({
    @required this.exam,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 190,
        width: 370,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    exam.name,
                    style: TextStyle(
                      fontFamily: "assets/fonts/Roboto-Medium.ttf",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff636e72),
                    ),
                  ),
                  Text(
                    "ID: " + exam.code,
                    style: TextStyle(
                      fontFamily: "assets/fonts/Roboto-Medium.ttf",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff636e72),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Color(0xff636e72),
                thickness: 0.5,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 17,
                        color: Color(0xff636e72),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "21 Oct, 1PM",
                        style: TextStyle(
                          fontFamily: "assets/fonts/Roboto-Medium.ttf",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff636e72),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 17,
                        color: Color(0xff636e72),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "24 Oct, 7PM",
                        style: TextStyle(
                          fontFamily: "assets/fonts/Roboto-Medium.ttf",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff636e72),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.timelapse,
                    size: 20,
                    color: Color(0xff636e72),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "1 hour",
                    style: TextStyle(
                      fontFamily: "assets/fonts/Roboto-Medium.ttf",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff636e72),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.list_alt,
                    size: 20,
                    color: Color(0xff636e72),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "25 Questions",
                    style: TextStyle(
                      fontFamily: "assets/fonts/Roboto-Medium.ttf",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff636e72),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<ExamStore>().startExam(exam, context);
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff74b9ff),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Start Exam",
                          style: TextStyle(
                            fontFamily: "assets/fonts/Roboto-Medium.ttf",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

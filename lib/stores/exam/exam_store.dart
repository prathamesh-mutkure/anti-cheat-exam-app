import 'dart:async';

import 'package:anti_cheat_exam_app/constants/routes.dart';
import 'package:anti_cheat_exam_app/models/exam/Exam.dart';
import 'package:anti_cheat_exam_app/models/exam/Question.dart';
import 'package:anti_cheat_exam_app/network/exam_apis.dart';
import 'package:anti_cheat_exam_app/stores/exam/assigned_exam_store.dart';
import 'package:anti_cheat_exam_app/utils/app/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';

part 'exam_store.g.dart';

class ExamStore = _ExamStore with _$ExamStore;

abstract class _ExamStore with Store {
  @observable
  Exam? _currentExam;

  @observable
  int currentQuestionNo = 0;

  get currentExam => _currentExam;

  int? totalQuestions;

  @computed
  Question? get currentQuestion => _currentExam?.questions![currentQuestionNo];

  @observable
  ObservableList<String?>? answers;

  bool didLeaveExam = false;

  int leaveExamCount = 0;

  CountdownController? countdownController;

  @computed
  bool get isLastQuestion => currentQuestionNo == totalQuestions! - 1;

  @action
  startExam(
    String examId,
    String studentId,
    String token,
    BuildContext context,
  ) async {
    AppUtils.showLoading("Starting Exam..");

    _currentExam = await ExamApi.getExam(examId, studentId, token);
    totalQuestions = _currentExam?.questions!.length;
    answers = ObservableList();
    answers!.length = totalQuestions!;

    countdownController = CountdownController();

    AppUtils.dismissLoading();
    Navigator.pushNamed(
      context,
      Routes.exam,
    );
  }

  @action
  endExam(BuildContext context, String studentId, String token) async {
    try {
      AppUtils.showLoading("Submitting Exam...");
      bool submitted = await ExamApi.submitExam(
        studentId,
        _currentExam!.id,
        answers!.toList(),
        token,
      );

      if (submitted) {
        Navigator.pop(context);
        Timer(Duration(milliseconds: 100), () {
          _currentExam = null;
          totalQuestions = null;
          answers = null;
          countdownController!.pause();
          countdownController = null;
          currentQuestionNo = 0;
        });
        AppUtils.dismissLoading();
        context.read<AssignedExamStore>().getAssignedExams(studentId, token);
      }
    } catch (e) {
      print(e);
      AppUtils.showToast(e.toString());
    }
  }

  @action
  goToNextQuestion() {
    if (currentQuestionNo != totalQuestions! - 1) currentQuestionNo++;
  }

  @action
  goToPreviousQuestion() {
    if (currentQuestionNo != 0) currentQuestionNo--;
  }

  @action
  goToQuestion(int quesNo) {
    currentQuestionNo = quesNo;
  }

  @action
  setAnswer(int questionNo, String? key) {
    answers![questionNo] = key;
  }
}

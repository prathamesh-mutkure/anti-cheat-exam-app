import 'package:anti_cheat_exam_app/data/network/exam_apis.dart';
import 'package:anti_cheat_exam_app/models/exam/Exam.dart';
import 'package:anti_cheat_exam_app/models/exam/Question.dart';
import 'package:anti_cheat_exam_app/routes.dart';
import 'package:anti_cheat_exam_app/utils/app/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
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

  @action
  startExam(String examId, BuildContext context) async {
    AppUtils.showLoading("Starting Exam..");

    _currentExam = await ExamApi.getExam(examId);
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
  endExam() {
    _currentExam = null;
    countdownController!.pause();
    countdownController = null;
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

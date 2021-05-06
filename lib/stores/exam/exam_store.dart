import 'package:anti_cheat_exam_app/models/exam/Exam.dart';
import 'package:anti_cheat_exam_app/models/exam/Question.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../routes.dart';

part 'exam_store.g.dart';

class ExamStore = _ExamStore with _$ExamStore;

abstract class _ExamStore with Store {
  @observable
  Exam? _currentExam;

  @observable
  int currentQuestionNo = 0;

  int? totalQuestions;

  get currentExam => _currentExam;

  @computed
  Question? get currentQuestion => _currentExam?.questions[currentQuestionNo];

  @action
  startExam(Exam exam, BuildContext context) {
    if (_currentExam == null) {
      _currentExam = exam;
      totalQuestions = _currentExam?.questions.length;
    }

    Navigator.pushNamed(
      context,
      Routes.exam,
    );
  }

  @action
  endExam() {
    _currentExam = null;
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
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExamStore on _ExamStore, Store {
  Computed<Question?>? _$currentQuestionComputed;

  @override
  Question? get currentQuestion => (_$currentQuestionComputed ??=
          Computed<Question?>(() => super.currentQuestion,
              name: '_ExamStore.currentQuestion'))
      .value;

  final _$_currentExamAtom = Atom(name: '_ExamStore._currentExam');

  @override
  Exam? get _currentExam {
    _$_currentExamAtom.reportRead();
    return super._currentExam;
  }

  @override
  set _currentExam(Exam? value) {
    _$_currentExamAtom.reportWrite(value, super._currentExam, () {
      super._currentExam = value;
    });
  }

  final _$currentQuestionNoAtom = Atom(name: '_ExamStore.currentQuestionNo');

  @override
  int get currentQuestionNo {
    _$currentQuestionNoAtom.reportRead();
    return super.currentQuestionNo;
  }

  @override
  set currentQuestionNo(int value) {
    _$currentQuestionNoAtom.reportWrite(value, super.currentQuestionNo, () {
      super.currentQuestionNo = value;
    });
  }

  final _$_ExamStoreActionController = ActionController(name: '_ExamStore');

  @override
  dynamic startExam(Exam exam, BuildContext context) {
    final _$actionInfo =
        _$_ExamStoreActionController.startAction(name: '_ExamStore.startExam');
    try {
      return super.startExam(exam, context);
    } finally {
      _$_ExamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic endExam() {
    final _$actionInfo =
        _$_ExamStoreActionController.startAction(name: '_ExamStore.endExam');
    try {
      return super.endExam();
    } finally {
      _$_ExamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic goToNextQuestion() {
    final _$actionInfo = _$_ExamStoreActionController.startAction(
        name: '_ExamStore.goToNextQuestion');
    try {
      return super.goToNextQuestion();
    } finally {
      _$_ExamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic goToPreviousQuestion() {
    final _$actionInfo = _$_ExamStoreActionController.startAction(
        name: '_ExamStore.goToPreviousQuestion');
    try {
      return super.goToPreviousQuestion();
    } finally {
      _$_ExamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentQuestionNo: ${currentQuestionNo},
currentQuestion: ${currentQuestion}
    ''';
  }
}

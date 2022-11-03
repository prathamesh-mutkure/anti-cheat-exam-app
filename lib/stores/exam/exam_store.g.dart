// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExamStore on _ExamStore, Store {
  Computed<Question?>? _$currentQuestionComputed;

  @override
  Question? get currentQuestion => (_$currentQuestionComputed ??=
          Computed<Question?>(() => super.currentQuestion,
              name: '_ExamStore.currentQuestion'))
      .value;
  Computed<bool>? _$isLastQuestionComputed;

  @override
  bool get isLastQuestion =>
      (_$isLastQuestionComputed ??= Computed<bool>(() => super.isLastQuestion,
              name: '_ExamStore.isLastQuestion'))
          .value;

  late final _$_currentExamAtom =
      Atom(name: '_ExamStore._currentExam', context: context);

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

  late final _$currentQuestionNoAtom =
      Atom(name: '_ExamStore.currentQuestionNo', context: context);

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

  late final _$answersAtom = Atom(name: '_ExamStore.answers', context: context);

  @override
  ObservableList<String?>? get answers {
    _$answersAtom.reportRead();
    return super.answers;
  }

  @override
  set answers(ObservableList<String?>? value) {
    _$answersAtom.reportWrite(value, super.answers, () {
      super.answers = value;
    });
  }

  late final _$startExamAsyncAction =
      AsyncAction('_ExamStore.startExam', context: context);

  @override
  Future startExam(
      String examId, String studentId, String token, BuildContext context) {
    return _$startExamAsyncAction
        .run(() => super.startExam(examId, studentId, token, context));
  }

  late final _$endExamAsyncAction =
      AsyncAction('_ExamStore.endExam', context: context);

  @override
  Future endExam(BuildContext context, String studentId, String token) {
    return _$endExamAsyncAction
        .run(() => super.endExam(context, studentId, token));
  }

  late final _$_ExamStoreActionController =
      ActionController(name: '_ExamStore', context: context);

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
  dynamic goToQuestion(int quesNo) {
    final _$actionInfo = _$_ExamStoreActionController.startAction(
        name: '_ExamStore.goToQuestion');
    try {
      return super.goToQuestion(quesNo);
    } finally {
      _$_ExamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAnswer(int questionNo, String? key) {
    final _$actionInfo =
        _$_ExamStoreActionController.startAction(name: '_ExamStore.setAnswer');
    try {
      return super.setAnswer(questionNo, key);
    } finally {
      _$_ExamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentQuestionNo: ${currentQuestionNo},
answers: ${answers},
currentQuestion: ${currentQuestion},
isLastQuestion: ${isLastQuestion}
    ''';
  }
}

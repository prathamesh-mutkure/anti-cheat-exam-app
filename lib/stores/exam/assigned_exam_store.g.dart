// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_exam_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AssignedExamStore on _AssignedExamStore, Store {
  final _$errorAtom = Atom(name: '_AssignedExamStore.error');

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadingAtom = Atom(name: '_AssignedExamStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$getAssignedExamsAsyncAction =
      AsyncAction('_AssignedExamStore.getAssignedExams');

  @override
  Future getAssignedExams(String studentId) {
    return _$getAssignedExamsAsyncAction
        .run(() => super.getAssignedExams(studentId));
  }

  @override
  String toString() {
    return '''
error: ${error},
loading: ${loading}
    ''';
  }
}

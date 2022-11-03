// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_exam_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AssignedExamStore on _AssignedExamStore, Store {
  late final _$assignedExamsAtom =
      Atom(name: '_AssignedExamStore.assignedExams', context: context);

  @override
  ObservableList<Exam> get assignedExams {
    _$assignedExamsAtom.reportRead();
    return super.assignedExams;
  }

  @override
  set assignedExams(ObservableList<Exam> value) {
    _$assignedExamsAtom.reportWrite(value, super.assignedExams, () {
      super.assignedExams = value;
    });
  }

  late final _$getAssignedExamsAsyncAction =
      AsyncAction('_AssignedExamStore.getAssignedExams', context: context);

  @override
  Future getAssignedExams(String studentId, String token) {
    return _$getAssignedExamsAsyncAction
        .run(() => super.getAssignedExams(studentId, token));
  }

  @override
  String toString() {
    return '''
assignedExams: ${assignedExams}
    ''';
  }
}

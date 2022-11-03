// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentStore on _StudentStore, Store {
  late final _$isLoggedInAtom =
      Atom(name: '_StudentStore.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$_StudentStoreActionController =
      ActionController(name: '_StudentStore', context: context);

  @override
  dynamic login(Student student) {
    final _$actionInfo = _$_StudentStoreActionController.startAction(
        name: '_StudentStore.login');
    try {
      return super.login(student);
    } finally {
      _$_StudentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic logout() {
    final _$actionInfo = _$_StudentStoreActionController.startAction(
        name: '_StudentStore.logout');
    try {
      return super.logout();
    } finally {
      _$_StudentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoggedIn: ${isLoggedIn}
    ''';
  }
}

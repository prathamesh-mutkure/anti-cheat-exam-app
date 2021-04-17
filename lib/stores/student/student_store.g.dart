// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentStore on _StudentStore, Store {
  final _$isLoggedInAtom = Atom(name: '_StudentStore.isLoggedIn');

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

  final _$_StudentStoreActionController =
      ActionController(name: '_StudentStore');

  @override
  dynamic login() {
    final _$actionInfo = _$_StudentStoreActionController.startAction(
        name: '_StudentStore.login');
    try {
      return super.login();
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

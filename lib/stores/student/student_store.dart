import 'package:mobx/mobx.dart';

part 'student_store.g.dart';

class StudentStore = _StudentStore with _$StudentStore;

abstract class _StudentStore with Store {
  @observable
  bool isLoggedIn = false;

  _StudentStore() {
    isLoggedIn = false;
  }

  @action
  login() {
    isLoggedIn = true;
  }

  @action
  logout() {
    isLoggedIn = false;
  }
}

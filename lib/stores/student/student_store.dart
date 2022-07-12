import 'package:anti_cheat_exam_app/models/student/Student.dart';
import 'package:mobx/mobx.dart';

part 'student_store.g.dart';

class StudentStore = _StudentStore with _$StudentStore;

abstract class _StudentStore with Store {
  Student? currentStudent;

  @observable
  bool isLoggedIn = false;

  _StudentStore() {
    isLoggedIn = false;
  }

  @action
  login(Student student) {
    currentStudent = student;
    isLoggedIn = true;
  }

  @action
  logout() {
    currentStudent = null;
    isLoggedIn = false;
  }
}

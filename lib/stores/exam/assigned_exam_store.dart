import 'package:anti_cheat_exam_app/data/network/exam_apis.dart';
import 'package:anti_cheat_exam_app/models/exam/Exam.dart';
import 'package:mobx/mobx.dart';

part 'assigned_exam_store.g.dart';

class AssignedExamStore = _AssignedExamStore with _$AssignedExamStore;

abstract class _AssignedExamStore with Store {
  ObservableList<Exam> assignedExams = ObservableList();

  @observable
  String? error;

  @observable
  bool loading = false;

  @action
  getAssignedExams(String studentId) async {
    loading = true;
    assignedExams.removeWhere((element) => true);
    try {
      List<Exam> exams = await ExamApi.getAssignedExams(studentId);
      assignedExams.addAll(exams);
      loading = false;
    } catch (e) {
      print(e);
      error = e.toString();
      loading = false;
    }
  }
}

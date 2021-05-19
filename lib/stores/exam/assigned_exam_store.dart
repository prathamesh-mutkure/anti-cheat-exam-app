import 'package:anti_cheat_exam_app/data/network/exam_apis.dart';
import 'package:anti_cheat_exam_app/models/exam/Exam.dart';
import 'package:anti_cheat_exam_app/utils/app/app_utils.dart';
import 'package:mobx/mobx.dart';

part 'assigned_exam_store.g.dart';

class AssignedExamStore = _AssignedExamStore with _$AssignedExamStore;

abstract class _AssignedExamStore with Store {
  ObservableList<Exam> assignedExams = ObservableList();

  @action
  getAssignedExams(String studentId) async {
    assignedExams.removeWhere((element) => true);
    try {
      AppUtils.showLoading("Loading Exams...");
      List<Exam> exams = await ExamApi.getAssignedExams(studentId);
      assignedExams.addAll(exams);
    } catch (e) {
      AppUtils.showToast(e.toString() + ", Please try again later");
    } finally {
      AppUtils.dismissLoading();
    }
  }
}

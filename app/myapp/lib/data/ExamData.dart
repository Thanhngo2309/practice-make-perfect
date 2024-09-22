import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/data/FirebaseFirestoreInst.dart';
import 'package:myapp/model/Exam.dart';
import 'package:myapp/model/Subject.dart';

class ExamData {
  static List<Exam> exams = [
    Exam(
        "Đề thi thử Môn Toán 2023 - Sở giáo dục và đào tạo Hải Dương",
        Subject.math,
        "SGDVDT-HD"),
    Exam(
        "Đề thi thử Môn Toán 2023 - Sở giáo dục và đào tạo Hà Nội,",
        Subject.math,
        "SGDVDT-HN"),
    Exam(
        "Đề thi thử Môn Lý 2023 - Sở giáo dục và đào tạo Hải Dương",
        Subject.physics,
        "SGDVDT-HD"),
    Exam(
        "Đề thi thử Môn Hóa 2023 - Sở giáo dục và đào tạo Hải Dương",
        Subject.chemistry,
        "SGDVDT-HD"),
    Exam(
        "Đề thi thử Môn Sinh 2023 - Sở giáo dục và đào tạo Hải Dương",
        Subject.biology,
        "SGDVDT-HD"),
    Exam(
        "Đề thi thử Môn Văn 2023 - Sở giáo dục và đào tạo Hải Dương",
        Subject.literature,
        "SGDVDT-HD"),
    Exam(
        "Đề thi thử Môn Sử 2023 - Sở giáo dục và đào tạo Hải Dương",
        Subject.history,
        "SGDVDT-HD"),
    Exam(
        "Đề thi thử Môn Địa 2023 - Sở giáo dục và đào tạo Hải Dương",
        Subject.geography,
        "SGDVDT-HD"),
  ];

  static final ExamData _instance = ExamData._internal();
  ExamData._internal();

  static ExamData getInstance() {
    return _instance;
  }

  Exam getExamByExamId(String examId) {
    return exams.firstWhere((exam) => exam.examId == examId);
  }

  List<Exam> getExamsBySubject(Subject subject) {
    return exams.where((exam) => exam.subject == subject).toList();
  }

  List<Exam> getAllExams() {
    return exams;
  }

  void save(Exam exam) {
    FirebaseFirestore db = FirestoreInst.getInstance();
    db.collection("exams").add({
      "name": exam.name,
      "subject": exam.subject.toString(),
      "examId": exam.examId,
    }).then((value) {
      print("Exam added with ID: ${value.id}");
    }).catchError((error) {
      print("Failed to add exam: $error");
    });
  }
}

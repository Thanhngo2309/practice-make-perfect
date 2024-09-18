import 'package:myapp/model/Exam.dart';
import 'package:myapp/model/Subject.dart';

class ExamData {
  static List<Exam> exams = [
    Exam(
        "SGDVDT-HD-Toan-20/12",
        "Đề thi thử Môn Toán 2023 - Sở giáo dục và đào tạo Hải Dương",
        Subject.math,
        "SGDVDT-HD"),
    Exam(
        "SGDVDT-HN-Toan-12/11",
        "Đề thi thử Môn Toán 2023 - Sở giáo dục và đào tạo Hà Nội,",
        Subject.math,
        "SGDVDT-HN"),
    Exam(
        "SGDVDT-HD-Ly-20/12",
        "Đề thi thử Môn Lý 2023 - Sở giáo dục và đào tạo Hải Dương",
        Subject.physics,
        "SGDVDT-HD"),
    Exam(
        "SGDVDT-HD-Hoa-20/12",
        "Đề thi thử Môn Hóa 2023 - Sở giáo dục và đào tạo Hải Dương",
        Subject.chemistry,
        "SGDVDT-HD"),
    Exam(
        "SGDVDT-HD-Sinh-20/12",
        "Đề thi thử Môn Sinh 2023 - Sở giáo dục và đào tạo Hải Dương",
        Subject.biology,
        "SGDVDT-HD"),
    Exam(
        "SGDVDT-HD-Van-20/12",
        "Đề thi thử Môn Văn 2023 - Sở giáo dục và đào tạo Hải Dương",
        Subject.literature,
        "SGDVDT-HD"),
    Exam(
        "SGDVDT-HD-Su-20/12",
        "Đề thi thử Môn Sử 2023 - Sở giáo dục và đào tạo Hải Dương",
        Subject.history,
        "SGDVDT-HD"),
    Exam(
        "SGDVDT-HD-Dia-20/12",
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
}

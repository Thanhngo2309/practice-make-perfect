import 'package:myapp/model/Answer.dart';

class AnswerData {
  static final AnswerData _instance = AnswerData._internal();
  AnswerData._internal();

  static AnswerData getInstance() {
    return _instance;
  }

  static List<Answer> answers = [
    Answer(
        "SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-1", "A", "Because 1+1=2"),
    Answer(
        "SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-2", "A", "Because 2+2=4"),
    Answer(
        "SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-3", "A", "Because 3+3=6"),
    Answer(
        "SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-4", "A", "Because 4+4=8"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-5", "A",
        "Because 5+5=10"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-6", "A",
        "Because 6+6=12"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-7", "A",
        "Because 7+7=14"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-8", "A",
        "Because 8+8=16"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-9", "A",
        "Because 9+9=18"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-10", "A",
        "Because 10+10=20"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-11", "A",
        "Because 11+11=22"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-12", "A",
        "Because 12+12=24"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-13", "A",
        "Because 13+13=26"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-14", "A",
        "Because 14+14=28"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-15", "A",
        "Because 15+15=30"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-16", "A",
        "Because 16+16=32"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-17", "A",
        "Because 17+17=34"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-18", "A",
        "Because 18+18=36"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-19", "A",
        "Because 19+19=38"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-20", "A",
        "Because 20+20=40"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-21", "A",
        "Because 21+21=42"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-22", "A",
        "Because 22+22=44"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-23", "A",
        "Because 23+23=46"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-24", "A",
        "Because 24+24=48"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-25", "A",
        "Because 25+25=50"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-26", "A",
        "Because 26+26=52"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-27", "A",
        "Because 27+27=54"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-28", "A",
        "Because 28+28=56"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-29", "A",
        "Because 29+29=58"),
    Answer("SGDVDT-HD-Toan-20/12", "SGDVDT-HD-Toan-20/12-30", "A",
        "Because 30+30=60"),
  ];

  List<Answer> getAnswersByExamId(String examId) {
    return answers.where((answer) => answer.examId == examId).toList();
  }

  Answer? getAnswerByQuestionId(String questionId) {
    try {
      return answers.firstWhere((answer) => answer.questionId == questionId);
    } catch (e) {
      // Trả về null nếu không tìm thấy Answer nào phù hợp
      return null;
    }
  }
}

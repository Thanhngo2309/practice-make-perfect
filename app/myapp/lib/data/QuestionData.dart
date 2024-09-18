import 'package:myapp/model/Question.dart';

class QuestionData {
  static final QuestionData _instance = QuestionData._internal();
  static List<Question> questions = [];

  factory QuestionData() {
    return _instance;
  }

  QuestionData._internal() {
    _initializeQuestions();
  }

  void _initializeQuestions() {
    if (questions.isEmpty) {
      questions.addAll([
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-1",
          questionText: "What is 1+1",
          choiceContent: ["2", "3", "4", "5"],
          number: 1,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-2",
          questionText: "What is 2+2",
          choiceContent: ["4", "3", "4", "5"],
          number: 2,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-3",
          questionText: "What is 3+3",
          choiceContent: ["6", "3", "4", "5"],
          number: 3,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-4",
          questionText: "What is 4+4",
          choiceContent: ["8", "3", "4", "5"],
          number: 4,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-5",
          questionText: "What is 5+5",
          choiceContent: ["10", "3", "4", "5"],
          number: 5,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-6",
          questionText: "What is 6+6",
          choiceContent: ["12", "3", "4", "5"],
          number: 6,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-7",
          questionText: "What is 7+7",
          choiceContent: ["14", "3", "4", "5"],
          number: 7,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-8",
          questionText: "What is 8+8",
          choiceContent: ["16", "3", "4", "5"],
          number: 8,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-9",
          questionText: "What is 9+9",
          choiceContent: ["18", "3", "4", "5"],
          number: 9,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-10",
          questionText: "What is 10+10",
          choiceContent: ["20", "3", "4", "5"],
          number: 10,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-11",
          questionText: "What is 11+11",
          choiceContent: ["22", "3", "4", "5"],
          number: 11,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-12",
          questionText: "What is 12+12",
          choiceContent: ["24", "3", "4", "5"],
          number: 12,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-13",
          questionText: "What is 13+13",
          choiceContent: ["26", "3", "4", "5"],
          number: 13,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-14",
          questionText: "What is 14+14",
          choiceContent: ["28", "3", "4", "5"],
          number: 14,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-15",
          questionText: "What is 15+15",
          choiceContent: ["30", "3", "4", "5"],
          number: 15,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-16",
          questionText: "What is 16+16",
          choiceContent: ["32", "3", "4", "5"],
          number: 16,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-17",
          questionText: "What is 17+17",
          choiceContent: ["34", "3", "4", "5"],
          number: 17,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-18",
          questionText: "What is 18+18",
          choiceContent: ["36", "3", "4", "5"],
          number: 18,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-19",
          questionText: "What is 19+19",
          choiceContent: ["38", "3", "4", "5"],
          number: 19,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-20",
          questionText: "What is 20+20",
          choiceContent: ["40", "3", "4", "5"],
          number: 20,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-21",
          questionText: "What is 21+21",
          choiceContent: ["42", "3", "4", "5"],
          number: 21,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-22",
          questionText: "What is 22+22",
          choiceContent: ["44", "3", "4", "5"],
          number: 22,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-23",
          questionText: "What is 23+23",
          choiceContent: ["46", "3", "4", "5"],
          number: 23,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-24",
          questionText: "What is 24+24",
          choiceContent: ["48", "3", "4", "5"],
          number: 24,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-25",
          questionText: "What is 25+25",
          choiceContent: ["50", "3", "4", "5"],
          number: 25,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-26",
          questionText: "What is 26+26",
          choiceContent: ["52", "3", "4", "5"],
          number: 26,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-27",
          questionText: "What is 27+27",
          choiceContent: ["54", "3", "4", "5"],
          number: 27,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-28",
          questionText: "What is 28+28",
          choiceContent: ["56", "3", "4", "5"],
          number: 28,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-29",
          questionText: "What is 29+29",
          choiceContent: ["58", "3", "4", "5"],
          number: 29,
          imagePath: "",
        ),
        Question(
          examId: "SGDVDT-HD-Toan-20/12",
          questionId: "SGDVDT-HD-Toan-20/12-30",
          questionText: "What is 30+30",
          choiceContent: ["60", "3", "4", "5"],
          number: 30,
          imagePath: "",
        ),
      ]);
    }
  }

  List<Question> getQuestionsByExamId(String examId) {
    return questions.where((question) => question.examId == examId).toList();
  }
}

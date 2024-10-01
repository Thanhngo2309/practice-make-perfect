import '../Choice.dart';

class QuestionResponse {
  String examId;
  late String questionId;
  String questionText;
  late List<Choice> choices;
  int number;
  String imagePath;

  QuestionResponse(this.examId, this.questionId, this.questionText,
      this.choices, this.number, this.imagePath);
}

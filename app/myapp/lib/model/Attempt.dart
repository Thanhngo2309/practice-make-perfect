import 'Question.dart';
import 'Result.dart';
import 'SelectedAnswer.dart';

class Attempt {
  late String attemptId;
  late Result result;
  late List<Question> questions;
  late List<SelectedAnswer> selectedAnswers;
  String examId;
  late String totalTime;

  Attempt(this.questions, this.selectedAnswers, this.examId) {
    attemptId = '${examId}_${DateTime.now().toIso8601String()}';
    this.totalTime = '0';
  }

  void setTotalTime(String totalTime) {
    this.totalTime = totalTime;
  }
}

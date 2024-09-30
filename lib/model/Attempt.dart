import 'Question.dart';
import 'Result.dart';
import 'SelectedAnswer.dart';
import 'dto/QuestionResponse.dart';

class Attempt {
  late String attemptId;
  late Result result;
  late List<QuestionResponse> questions;
  late List<SelectedAnswer> selectedAnswers;
  String examId;
  late String totalTime; // Ensure totalTime is a String

  Attempt(this.questions, this.selectedAnswers, this.examId) {
    attemptId = '${examId}_${DateTime.now().toIso8601String()}';
    totalTime = '0';
  }

  void setTotalTime(String totalTime) {
    this.totalTime = totalTime;
  }

  @override
  String toString() {
    return 'Attempt{examId: $examId, questions: $questions, selectedAnswers: $selectedAnswers}';
  }
}

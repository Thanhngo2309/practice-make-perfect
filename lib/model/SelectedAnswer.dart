class SelectedAnswer {
  String examId;
  String questionId;
  String selectedAnswer;
  late bool isCorrect;

  SelectedAnswer(
      {required this.examId,
      required this.questionId,
      required this.selectedAnswer}) {
    isCorrect = false;
  }

  bool isCorrectAnswer(String correctAnswer) {
    isCorrect = selectedAnswer == correctAnswer;
    return isCorrect;
  }
}

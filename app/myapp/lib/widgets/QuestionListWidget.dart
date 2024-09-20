import 'dart:async';

import 'package:flutter/material.dart';
import '../data/AttemptData.dart';
import '../data/QuestionData.dart';
import '../model/Attempt.dart';
import '../model/Question.dart';
import '../model/SelectedAnswer.dart';
import '../util/AutoGenerateSelectedAnswerService.dart';
import '../util/TimeConvert.dart';
import 'QuestionCardWidget.dart';
import 'ResultWidget.dart';

class QuestionListWidget extends StatefulWidget {
  final String examId;
  final int duration;

  const QuestionListWidget(this.examId, this.duration, {super.key});

  @override
  State<QuestionListWidget> createState() => _QuestionListWidgetState();
}

class _QuestionListWidgetState extends State<QuestionListWidget> {
  late List<Question> questions;
  late Map<int, SelectedAnswer> selectedAnswersMap;
  late int currentQuestionIndex;
  late Attempt attempt;
  late int remainingSeconds;
  Timer? _timer;
  bool isExamCompleted = false;

  @override
  void initState() {
    super.initState();
    questions = QuestionData().getQuestionsByExamId(widget.examId);
    selectedAnswersMap = AutoGenerateSelectedAnswerService.getInstance()
        .generate(questions, widget.examId);
    currentQuestionIndex = 0;
    attempt =
        Attempt(questions, selectedAnswersMap.values.toList(), widget.examId);
    remainingSeconds = widget.duration;
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void onSelect(String selectedLabel, Question question) {
    setState(() {
      selectedAnswersMap[currentQuestionIndex] = SelectedAnswer(
        questionId: question.questionId,
        selectedAnswer: selectedLabel,
        examId: widget.examId,
      );
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        isExamCompleted = true;
      }
    });
  }

  void submitExam() {
    attempt.selectedAnswers = selectedAnswersMap.values.toList();
    attempt.setTotalTime(
        TimeConvert.secondsToHHMMSS(widget.duration - remainingSeconds));
    AttemptData.getInstance().save(attempt);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultWidget(attempt),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Câu ${currentQuestionIndex + 1}/${questions.length}',
                  style: const TextStyle(color: Colors.orange),
                ),
                Text(TimeConvert.secondsToHHMMSS(remainingSeconds)),
                ElevatedButton(
                    onPressed: () => submitExam(), child: const Text("Nộp bài")),
              ],
            ),
          ),
          Expanded(
            child:
                QuestionCardWidget(questions[currentQuestionIndex], onSelect),
          ),
        ],
      ),
    );
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          _timer?.cancel();
          submitExam(); // Tự động nộp bài khi hết giờ
        }
      });
    });
  }
}

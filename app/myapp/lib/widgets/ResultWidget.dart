import 'package:flutter/material.dart';
import '../application-service/CalculateScoreService.dart';
import '../data/AnswerData.dart';
import '../model/Answer.dart';
import '../model/Attempt.dart';
import '../model/Question.dart';
import '../model/SelectedAnswer.dart';
import 'QuestionListWidget.dart';
import 'SelectedAnswerDetailWidget.dart';

class ResultWidget extends StatelessWidget {
  Attempt attempt;

  ResultWidget(this.attempt, {super.key}) {
    attempt.result = CalculateScoreService()
        .calculateScore(attempt.selectedAnswers, attempt.questions);
  }

  @override
  Widget build(BuildContext context) {
    print("Đang build");

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Expanded(child: Text("Kết quả bài thi")),
            ElevatedButton(
                onPressed: () => retakeExam(context, attempt.examId),
                child: const Text("Làm lại"))
          ],
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text(
                "Điểm : ${attempt.result.score}",
                style: const TextStyle(color: Colors.blue),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.timer, color: Colors.purple),
              Text(attempt.totalTime)
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Đúng : ${attempt.result.correctNumbers}",
                style: const TextStyle(color: Colors.green),
              ),
              Text(
                "Chưa trả lời : ${attempt.result.unanswerNumbes}",
                style: const TextStyle(color: Colors.orange),
              ),
              Text(
                "Sai : ${attempt.result.incorrectNumbers}",
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            "Chạm vào câu bất kỳ để xem chi tiết",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.count(
            crossAxisCount: 4,
            children: attempt.selectedAnswers.asMap().entries.map((entry) {
              int index = entry.key;
              SelectedAnswer ans = entry.value;
              return Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (ans.isCorrect) ? Colors.blue : Colors.red,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => answerDetail(
                            context, attempt.questions[index], ans),
                      ),
                    );
                  },
                  child: Text(
                    "Câu ${index + 1}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ]),
    );
  }

  Widget answerDetail(
      BuildContext context, Question question, SelectedAnswer ans) {
    Answer? answer =
        AnswerData.getInstance().getAnswerByQuestionId(question.questionId);
    return SelectedAnswerDetailWidget(ans, question, answer!);
  }

  void retakeExam(BuildContext context, String examId) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => QuestionListWidget(examId, 90 * 60)),
    );
  }
}

import 'package:flutter/material.dart';

import '../model/Answer.dart';
import '../model/Question.dart';
import '../model/SelectedAnswer.dart';
import 'ChatWidget.dart';

class SelectedAnswerDetailWidget extends StatelessWidget {
  final SelectedAnswer selectedAnswer;
  final Question question;
  final Answer answer;

  const SelectedAnswerDetailWidget(this.selectedAnswer, this.question, this.answer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Expanded(child: Text("Quay lại")),
            Icon(Icons.favorite, color: Colors.grey),
          ],
        ),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (selectedAnswer.selectedAnswer == answer)
                      ? Colors.blue
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    selectedAnswer.selectedAnswer, // Adjust accordingly
                    style: TextStyle(
                      color: (selectedAnswer.selectedAnswer == answer)
                          ? Colors.white
                          : Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              answer.answerDetail,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const Dialog(
                child: ChatWidget(),
              );
            },
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.chat),
      ),
    );
  }
}

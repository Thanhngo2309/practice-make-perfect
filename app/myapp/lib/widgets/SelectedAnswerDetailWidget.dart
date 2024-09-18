import 'package:flutter/material.dart';

import '../model/Answer.dart';
import '../model/Question.dart';
import '../model/SelectedAnswer.dart';
import 'ChatWidget.dart';

class SelectedAnswerDetailWidget extends StatelessWidget {
  final SelectedAnswer selectedAnswer;
  final Question question;
  final Answer answer;

  SelectedAnswerDetailWidget(this.selectedAnswer, this.question, this.answer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(child: Text("Quay lại")),
            Icon(Icons.favorite, color: Colors.grey),
          ],
        ),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
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
            SizedBox(height: 10),
            Text(
              answer.answerDetail,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: ChatWidget(),
              );
            },
          );
        },
        child: Icon(Icons.chat),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

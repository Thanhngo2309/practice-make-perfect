import 'package:flutter/material.dart';
import '../model/Question.dart';

class QuestionCardWidget extends StatelessWidget {
  Question question;
  Function(String, Question) onSelect;

  QuestionCardWidget(this.question, this.onSelect, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  question.questionText,
                )
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: question.choices.map((choice) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ElevatedButton(
                    child: Text("${choice.label} . ${choice.content}"),
                    onPressed: () => onSelect(choice.label, question),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

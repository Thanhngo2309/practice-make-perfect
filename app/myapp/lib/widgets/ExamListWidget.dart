import 'package:flutter/material.dart';
import '../data/ExamData.dart';
import '../model/Exam.dart';
import 'ExamCardWidget.dart';

class ExamListWidget extends StatelessWidget {
  List<Exam> exams = ExamData.getInstance().getAllExams();

  ExamListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print(exams);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách đề thi'),
      ),
      body: ListView.builder(
        itemCount: exams.length + 1, // +1 cho tiêu đề
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'HOT! Hướng dẫn giải đề minh họa môn Toán tốt nghiệp THPT 2021 Bộ GD&ĐT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            );
          }
          final exam = exams[index - 1];
          return ExamCardWidget(
            exam: exam,
          );
        },
      ),
    );
  }
}

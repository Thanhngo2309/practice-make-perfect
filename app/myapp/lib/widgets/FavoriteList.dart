import 'package:flutter/material.dart';

import '../application-service/SharedPrefs.dart';
import '../data/ExamData.dart';
import '../model/Exam.dart';
import 'ExamItem.dart';

class FavoriteList extends StatelessWidget {
  final String examTitle;
  final List<Exam> exams;
  FavoriteList({super.key, required this.examTitle})
      : exams = ExamData.getInstance().getAllExams();

  @override
  Widget build(BuildContext context) {
    // Lấy danh sách các ID kỳ thi yêu thích từ SharedPrefs
    List<String> favoriteIds = SharedPrefs.getString(examTitle) == null
        ? []
        : SharedPrefs.getString(examTitle)!.split(',').toList();

    // Lọc các kỳ thi yêu thích từ danh sách kỳ thi dựa trên ID
    List<Exam> favoriteExams = exams
        .where(
            (e) => favoriteIds.contains(e.examId)) // Sử dụng examId thay vì id
        .toList();

    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: ExamItem(
              exam: favoriteExams[index],
              withHeartIcon: false,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemCount: favoriteExams.length);
  }
}

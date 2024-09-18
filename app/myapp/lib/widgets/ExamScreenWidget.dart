import 'package:flutter/material.dart';
import '../data/ExamData.dart';
import '../model/Exam.dart';
import '../model/Subject.dart';
import 'DocumentScreen.dart';
import 'ExamList.dart';
import 'FavoriteList.dart';

class ExamScreenWidget extends StatelessWidget {
  static const routeName = "/exam";
  final Subject subject;
  final List<Exam> exams;

  ExamScreenWidget({super.key, required this.subject})
      : exams = ExamData.getInstance().getExamsBySubject(subject);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text(subject.name),
              bottom: const TabBar(tabs: [
                Tab(
                  text: "Đề thi",
                ),
                Tab(
                  text: "Yêu thích",
                ),
                Tab(text: "Tài liệuu")
              ]),
            ),
            body: TabBarView(children: [
              ExamList(examList: exams),
              FavoriteList(examTitle: 'Toán'),
              DocumentScreen(),
            ])));
  }
}

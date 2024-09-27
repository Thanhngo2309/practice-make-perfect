// import 'package:flutter/material.dart';
// import 'package:myapp/model/dto/ExamResponse.dart';
// import '../data/ExamData.dart';
// import '../model/Subject.dart';
// import 'DocumentScreen.dart';
// import 'ExamList.dart';
// import 'FavoriteList.dart';

// class ExamsWidget extends StatelessWidget {
//   static const routeName = "/exam";
//   final Subject subject;

//   ExamsWidget({super.key, required this.subject});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(subject.name),
//           bottom: const TabBar(tabs: [
//             Tab(
//               text: "Đề thi",
//             ),
//             Tab(
//               text: "Yêu thích",
//             ),
//             Tab(text: "Tài liệu"),
//           ]),
//         ),
//         body: FutureBuilder<List<ExamResponse>>(
//           future: ExamData.getInstance().getExamsBySubject(subject),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Có lỗi xảy ra: ${snapshot.error}'));
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return Center(child: Text('Không có đề thi nào.'));
//             } else {
//               final exams = snapshot.data!;
//               print("ExamsWidget : all exams $exams");
//               return TabBarView(children: [
//                 ExamList(examsByObject: exams),
//                 FavoriteList(examTitle: subject.name), // Cập nhật tiêu đề yêu thích dựa trên subject
//                 DocumentScreen(),
//               ]);
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

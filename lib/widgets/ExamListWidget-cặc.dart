// import 'package:flutter/material.dart';
// import 'package:myapp/model/dto/ExamResponse.dart';
// import '../data/ExamData.dart';
// import '../model/Exam.dart';
// import 'ExamCardWidget.dart';

// class ExamListWidget extends StatelessWidget {
//   ExamListWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Danh sách đề thi'),
//       ),
//       body: FutureBuilder<List<ExamResponse>>(
//         future: ExamData.getInstance().getAllExams(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No exams found.'));
//           }

//           List<ExamResponse> exams = snapshot.data!;

//           return ListView.builder(
//             itemCount: exams.length + 1, // +1 cho tiêu đề
//             itemBuilder: (context, index) {
//               if (index == 0) {
//                 return const Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Text(
//                     'HOT! Hướng dẫn giải đề minh họa môn Toán tốt nghiệp THPT 2021 Bộ GD&ĐT',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 );
//               }
//               final exam = exams[index - 1];
//               return ExamCardWidget(
//                 exam: exam,
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

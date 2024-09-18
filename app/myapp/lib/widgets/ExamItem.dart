import 'package:flutter/material.dart';

import '../application-service/SharedPrefs.dart';
import '../model/Exam.dart';

class ExamItem extends StatefulWidget {
  final Exam exam;
  final bool withHeartIcon;

  const ExamItem({
    super.key,
    required this.exam,
    required this.withHeartIcon,
  });

  @override
  State<ExamItem> createState() => ExamItemState();
}

class ExamItemState extends State<ExamItem> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    String? idsString = SharedPrefs.getString('intList');
    if (idsString != null) {
      List<String> ids = idsString.split(',');
      if (ids.contains(widget.exam.examId)) {
        setState(() {
          isFavorite = true;
        });
      }
    }
  }

  Future<void> toogleFavorite() async {
    String? idsString = SharedPrefs.getString('intList');
    List<String> ids = idsString != null ? idsString.split(',') : [];

    if (isFavorite) {
      ids.remove(widget.exam.examId);
      setState(() {
        isFavorite = false;
      });
    } else {
      ids.add(widget.exam.examId);
      setState(() {
        isFavorite = true;
      });
    }

    await SharedPrefs.saveString('intList', ids.join(','));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.exam.name),
        Row(
          children: [
            const Icon(Icons.access_time, size: 16),
            const SizedBox(width: 4),
            Text('${widget.exam.duration ~/ 60} phút'),
            const SizedBox(width: 10),
            const Icon(Icons.question_answer, size: 16),
            const SizedBox(width: 4),
            Text('${widget.exam} câu'),
            const SizedBox(width: 10),
            const Icon(Icons.star, size: 16),
            const SizedBox(width: 4),
            Text('${widget.exam.subject.name}'),
            const SizedBox(width: 10),
            widget.withHeartIcon
                ? GestureDetector(
                    onTap: toogleFavorite,
                    child: Icon(
                      Icons.favorite,
                      size: 16,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                  )
                : const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}

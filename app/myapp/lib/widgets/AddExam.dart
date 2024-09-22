import 'package:flutter/material.dart';
import 'package:myapp/data/ExamData.dart';
import 'package:myapp/model/Exam.dart';
import 'package:myapp/model/Subject.dart';
import 'package:myapp/util/SubjectConverter.dart';
import 'package:myapp/widgets/QuestionEditor.dart';

class AddExam extends StatefulWidget {
  @override
  _AddExam createState() => _AddExam();
}

class _AddExam extends State<AddExam> {
  List<String> subjects = [
    'math',
    'physics',
    'history',
    'geography',
    'literature',
    'language',
    'chemistry',
    'art',
    'biology',
    'english',
  ];
  
  Subject? selectedSubject;
  String name = '';
  String description = '';
  int duration = 0;

  void clearSelectedSubjects() {
    setState(() {
      selectedSubject = null;
      name = '';
      description = '';
      duration = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chọn Môn Học')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[300]!, Colors.green[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Chọn Môn Học',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: subjects.map((String subject) {
                  return DropdownMenuItem<String>(
                    value: subject,
                    child: Text(subject),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedSubject = SubjectConverter.stringToSubject(value);
                      duration = (selectedSubject == Subject.math) ? 90 :
                                 (selectedSubject == Subject.literature) ? 180 : 60;
                    });
                  }
                },
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Tên',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: 'Mô Tả',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text("Thời gian: ${duration} phút"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Check if all fields are filled
                  if (selectedSubject == null || name.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Vui lòng điền đầy đủ thông tin!'))
                    );
                    return;
                  }
                  
                  print('Tên: $name, Mô Tả: $description, Môn Học: $selectedSubject');
                  Exam exam = Exam(name,selectedSubject!,"");
                  ExamData.getInstance().save(exam);
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => QuestionEditor(exam: exam))
                  );
                },
                child: Icon(Icons.navigate_next),
              )
            ],
          ),
        ),
      ),
    );
  }
}

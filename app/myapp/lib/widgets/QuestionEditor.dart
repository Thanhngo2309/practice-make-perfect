import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/data/QuestionData.dart';
import 'package:myapp/model/Exam.dart';
import 'package:myapp/model/Question.dart';
import 'package:firebase_storage/firebase_storage.dart'; 

class QuestionEditor extends StatefulWidget {
  final String routeName = '/question';
  final Exam exam;

  QuestionEditor({Key? key, required this.exam}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuestionEditorState();
}

class _QuestionEditorState extends State<QuestionEditor> {
  TextEditingController _questionController = TextEditingController();
  List<TextEditingController> _answerControllers = List.generate(4, (index) => TextEditingController());
  late List<Question> questions;
  late Map<String, File> tempImageQuestion; // Map<questionId, imageFile>
  late Map<String, List<File>> tempImageChoice; // Map<question, List<imageFile>>
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    questions = List.generate(widget.exam.numberOfQuestions, (index) => Question(
      examId: widget.exam.examId,
      questionText: '',
      choiceContent: List.filled(4, ''),
      number: index + 1,
      imagePath: '',
    ));
    tempImageQuestion = {};
    tempImageChoice = {};
    _loadCurrentQuestion();
  }

  Future<void> _pickImage(int answerIndex) async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        print("Image selected: ${image.path}");
        if (answerIndex == -1) {
          // Thêm ảnh vào tempImageQuestion
          tempImageQuestion[widget.exam.examId] = File(image.path);
          print("Image added to tempImageQuestion for examId ${widget.exam.examId}: ${tempImageQuestion[widget.exam.examId]}");
        } else {
          // Thêm ảnh vào tempImageChoice
          if (!tempImageChoice.containsKey(widget.exam.examId)) {
            tempImageChoice[widget.exam.examId] = [];
          }
          // Đảm bảo danh sách đủ dài để thêm ảnh
          while (tempImageChoice[widget.exam.examId]!.length <= answerIndex) {
            tempImageChoice[widget.exam.examId]!.add(File('')); // Thêm một File rỗng nếu cần
          }
          tempImageChoice[widget.exam.examId]![answerIndex] = File(image.path);
          print("Image added to tempImageChoice for examId ${widget.exam.examId}, answerIndex $answerIndex: ${tempImageChoice[widget.exam.examId]}");
        }
      } else {
        print("No image selected.");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> _uploadImages() async {
    for (var question in questions) {
      try {
        // In ra nội dung của tempImageQuestion
        print("tempImageQuestion: ${tempImageQuestion.toString()}");

        // Upload ảnh cho câu hỏi
        if (tempImageQuestion.containsKey(question.examId)) {
          File imageFile = tempImageQuestion[question.examId]!;
          String filePath = 'questions/${question.examId}/${DateTime.now().millisecondsSinceEpoch}_${imageFile.path.split('/').last}';
          await FirebaseStorage.instance.ref(filePath).putFile(imageFile);
          question.imagePath = await FirebaseStorage.instance.ref(filePath).getDownloadURL();
        } else {
          print("No image for question ${question.number} in tempImageQuestion.");
        }

        // In ra nội dung của tempImageChoice
        print("tempImageChoice: ${tempImageChoice.toString()}");

        // Upload ảnh cho đáp án
        if (tempImageChoice.containsKey(question.examId)) {
          List<Future<void>> uploads = []; // Danh sách Future để upload song song

          for (int i = 0; i < question.choices.length; i++) {
            if (tempImageChoice[question.examId]!.length > i) {
              File imageFile = tempImageChoice[question.examId]![i];
              String filePath = 'choices/${question.examId}/${DateTime.now().millisecondsSinceEpoch}_${imageFile.path.split('/').last}';

              // Thêm Future vào danh sách
              uploads.add(
                FirebaseStorage.instance.ref(filePath).putFile(imageFile).then((_) async {
                  question.choices[i].image = await FirebaseStorage.instance.ref(filePath).getDownloadURL();
                })
              );
            }
          }

          // Đợi tất cả upload của đáp án hoàn thành
          await Future.wait(uploads);
        } else {
          print("No images for question ${question.number} in tempImageChoice.");
        }
      } catch (e) {
        print("Error uploading images for question ${question.number}: $e");
      }
    }
  }

  void _saveToDb() async {
    await _uploadImages();
    questions.forEach((question) {
      if (question.questionText.isEmpty) {
        print("Question text is empty for question number: ${question.number}");
      }
    });

    QuestionData().saveAll(questions);
    print("Questions saved to database.");
  }

  void _nextQuestion() {
    _saveCurrentQuestion();
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        _loadCurrentQuestion();
      });
    } else {
      print("You are at the last question.");
    }
  }

  void _previousQuestion() {
    if (currentIndex > 0) {
      _saveCurrentQuestion();
      setState(() {
        currentIndex--;
        _loadCurrentQuestion();
      });
    }
  }

  void _saveCurrentQuestion() {
    if (currentIndex < questions.length) {
      Question currentQuestion = questions[currentIndex];
      currentQuestion.questionText = _questionController.text;

      for (int i = 0; i < _answerControllers.length; i++) {
        currentQuestion.choices[i].content = _answerControllers[i].text;
      }
    }
  }

  void _loadCurrentQuestion() {
    if (currentIndex < questions.length) {
      Question currentQuestion = questions[currentIndex];
      _questionController.text = currentQuestion.questionText;

      for (int i = 0; i < _answerControllers.length; i++) {
        _answerControllers[i].text = currentQuestion.choices[i].content;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Question Editor")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Question ${currentIndex + 1}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _questionController,
                              maxLines: 5,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Nhập câu hỏi...',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.image),
                            onPressed: () => _pickImage(-1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Đáp án",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _answerControllers[index],
                            decoration: InputDecoration(
                              labelText: 'Đáp án ${String.fromCharCode(65 + index)}',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(Icons.image),
                          onPressed: () => _pickImage(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _previousQuestion,
                    child: Icon(Icons.skip_previous),
                  ),
                  currentIndex == widget.exam.numberOfQuestions - 1
                      ? ElevatedButton(
                          onPressed: _saveToDb,
                          child: Icon(Icons.save_as),
                        )
                      : ElevatedButton(
                          onPressed: _nextQuestion,
                          child: Icon(Icons.skip_next),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
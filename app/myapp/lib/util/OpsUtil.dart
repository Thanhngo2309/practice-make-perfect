import 'package:myapp/model/Question.dart';

class OpsUtil {
  static Question toQuestion(List<Map<String,dynamic>> ops){
      return Question(examId: '', questionText: '', choiceContent: List.empty(), number: 1, imagePath: '');
  }
}
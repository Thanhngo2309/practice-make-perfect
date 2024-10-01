import 'package:myapp/model/Attempt.dart';

class AttemptData {
  static final AttemptData _instance = AttemptData._internal();

  List<Attempt> attempts = [];

  AttemptData._internal();

  static AttemptData getInstance() {
    return _instance;
  }

  void save(Attempt attempt) {
    attempts.add(attempt);
  }
}

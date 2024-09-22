import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/application-service/SharedPrefs.dart';
import 'package:myapp/model/Subject.dart';
import 'package:myapp/widgets/AddExam.dart';
import 'package:myapp/widgets/ChatScreen.dart';
import 'package:myapp/widgets/ExamScreenWidget.dart';
import 'package:myapp/widgets/HomeWidget.dart';
import 'package:myapp/widgets/LoginWidget.dart';
import 'package:myapp/widgets/RegisterWidget.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Đảm bảo binding đã được khởi tạo
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  await SharedPrefs.init(); // Khởi tạo SharedPrefs hoặc các dịch vụ khác
  runApp(const MyApp()); // Khởi chạy ứng dụng Flutter
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == ExamScreenWidget.routeName) {
          final subject = settings.arguments as Subject;
          return MaterialPageRoute(
            builder: (context) => ExamScreenWidget(
              subject: subject,
            ),
          );
        }
        return null;
      },
      initialRoute: '/signup',
      routes: {'/chat': (context) => ChatSreen(),
      '/': (context) =>HomeScreen(),
      '/signin': (context)=> LoginPage(),
      '/signup': (context)=>SignupPage()},
      debugShowCheckedModeBanner: false,
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:myapp/widgets/AddExam.dart';
// import 'package:myapp/widgets/QuestionEditor.dart';

// void main(){
//   runApp(MaterialApp(home: QuestionEditor(),));
// }
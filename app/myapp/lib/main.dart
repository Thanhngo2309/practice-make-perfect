import 'package:flutter/material.dart';
import 'package:myapp/application-service/SharedPrefs.dart';
import 'package:myapp/model/Subject.dart';
import 'package:myapp/widgets/ChatScreen.dart';
import 'package:myapp/widgets/ExamScreenWidget.dart';
import 'package:myapp/widgets/HomeWidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Đảm bảo binding đã được khởi tạo
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
      routes: {'/chat': (context) => ChatSreen()},
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

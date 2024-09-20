// import 'package:flutter/material.dart';
// import 'package:myapp/application-service/SharedPrefs.dart';
// import 'package:myapp/model/Subject.dart';
// import 'package:myapp/widgets/ChatScreen.dart';
// import 'package:myapp/widgets/ExamScreenWidget.dart';
// import 'package:myapp/widgets/HomeWidget.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // Đảm bảo binding đã được khởi tạo
//   await SharedPrefs.init(); // Khởi tạo SharedPrefs hoặc các dịch vụ khác
//   runApp(const MyApp()); // Khởi chạy ứng dụng Flutter
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'EduX',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       onGenerateRoute: (settings) {
//         if (settings.name == ExamScreenWidget.routeName) {
//           final subject = settings.arguments as Subject;
//           return MaterialPageRoute(
//             builder: (context) => ExamScreenWidget(
//               subject: subject,
//             ),
//           );
//         }
//         return null;
//       },
//       routes: {'/chat': (context) => ChatSreen()},
//       home: HomeScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Kiểm tra nếu đang chạy trên Web
  if (kIsWeb) {
    // Khởi tạo SDK JavaScript Facebook
    await FacebookAuth.instance.webInitialize(
      appId: "1453466665342677", // Thay thế bằng App ID của bạn
      cookie: true,
      xfbml: true,
      version: "4.2.0", // Sử dụng phiên bản mới nhất
    );
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook Login Example',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, dynamic>? _userData;

  Future<void> _loginWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final userData = await FacebookAuth.instance.getUserData();
        setState(() {
          _userData = userData;
        });
      } else {
        print("Login failed: ${result.status}");
        print("Message: ${result.message}");
      }
    } catch (error) {
      print("Error during Facebook login: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Facebook Login')),
      body: Center(
        child: _userData != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${_userData!['name']}'),
                  Text('Email: ${_userData!['email']}'),
                  ElevatedButton(
                    onPressed: () async {
                      await FacebookAuth.instance.logOut();
                      setState(() {
                        _userData = null;
                      });
                    },
                    child: Text('Logout'),
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: _loginWithFacebook,
                child: Text('Login with Facebook'),
              ),
      ),
    );
  }
}

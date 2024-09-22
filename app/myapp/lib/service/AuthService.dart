import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static User? get currentUser => FirebaseAuth.instance.currentUser;

  static Future<void> signup(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw e;
    }
  }

  static Future<void> signin(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw e;
    }
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut(); // Đăng xuất người dùng
  }
}
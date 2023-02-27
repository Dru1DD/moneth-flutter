import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static User? get currentUser => FirebaseAuth.instance.currentUser;

  static bool? _isLoggedIn;

  static bool isLoggedIn() {
    if (_isLoggedIn == null) {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        _isLoggedIn = user?.uid != null;
      });
      _isLoggedIn = _firebaseAuth.currentUser?.uid != null;
      return _isLoggedIn ?? false;
    } else {
      return _isLoggedIn ?? false;
    }
  }
}

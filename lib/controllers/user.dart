import 'package:flutter/cupertino.dart';
import 'package:fondeadora/models/user.dart';

class UserController with ChangeNotifier {
  bool logged = false;
  User? current;

  void login({required String email, required String password}) {
    if (password.length >= 5) {
      logged = true;
      current = User(email: email);
    } else {
      logged = false;
    }
    notifyListeners();
  }

  void logout() {
    logged = false;
    current = null;
    notifyListeners();
  }
}

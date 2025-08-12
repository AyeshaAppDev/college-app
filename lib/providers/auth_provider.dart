import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  // Mock login method
  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network delay

    if (email == "user@example.com" && password == "password") {
      _isLoggedIn = true;
      notifyListeners();
    } else {
      throw Exception("Invalid credentials");
    }
  }

  // Mock signup method
  Future<void> signup(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network delay

    // You can just assume any signup is successful
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}

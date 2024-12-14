import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lilac_task/core/services.dart/login_services/login_services.dart';

class LoginProvider extends ChangeNotifier {
  final LoginServices loginServices = LoginServices();

  bool isLoggedIn = false;
  bool isLoading = false;
  String? token;
  Future<void> checkLoginStatus() async {
    try {
      token = await loginServices.getToken();
      isLoggedIn = token != null && token!.isNotEmpty;
    } catch (e) {
      log('Error checking login status: $e');
      isLoggedIn = false;

      token = null;
    }
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    isLoading = true;

    try {
      final success = await loginServices.loginUser(email, password);
      if (success) {
        token = await loginServices.getToken();
        isLoggedIn = true;
        log('Login successful. Token: $token');
        return true;
      } else {
        isLoggedIn = false;
        log('Login failed.');
      }
    } catch (e) {
      log('Error during login: $e');
      isLoggedIn = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return false;
  }
}

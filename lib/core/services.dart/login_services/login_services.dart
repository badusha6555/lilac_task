import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginServices {
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<bool> loginUser(String email, String password) async {
    try {
      log('Attempting login with email: $email');

      final response = await dio.post(
        'https://test.vehup.com/api/vendor-login',
        data: {
          "email": email,
          "password": password,
        },
      );
      log('Response from login: ${response.statusCode} ${response.data}');

      if (response.statusCode == 200) {
        final token = response.data['token'];
        if (token != null) {
          await storage.write(key: 'auth_token', value: token);
          log('Token saved successfully.');
          return true;
        } else {
          log('No token received from the server.');
        }
      } else {
        log('Login failed. Status code: ${response.statusCode}');
        log('Response: ${response.data}');
      }
    } on DioException catch (e) {
      log('Login error: ${e.response?.statusCode} ${e.response?.data ?? e.message}');
      if (e.response?.statusCode == 401) {
        log('Unauthorized access');
      }
    } catch (e) {
      log('Unexpected error during login: $e');
    }
    return false;
  }

  Future<String?> getToken() async {
    try {
      final token = await storage.read(key: 'auth_token');
      if (token == null) {
        log('No token found.');
        return null;
      }
      log('Retrieved token: $token');
      return token;
    } catch (e) {
      log('Error reading token: $e');
      return null;
    }
  }

  Future<void> clearToken() async {
    try {
      await storage.delete(key: 'auth_token');
      log('Token cleared successfully.');
    } catch (e) {
      log('Error clearing token: $e');
    }
  }
}

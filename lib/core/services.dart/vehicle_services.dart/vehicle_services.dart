// import 'dart:developer';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lilac_task/core/services.dart/login_services/login_services.dart';
import 'package:lilac_task/data/models/vehicle.dart';

class ApiServices {
  final LoginServices _loginServices = LoginServices();
  late final Dio dio;

  ApiServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://test.vehup.com/api/vendor/get-total-vehicles',
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 10000),
        headers: {
          'Authorization': 'Bearer ${_loginServices.getToken()}',
        },
      ),
    );
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await dio.post(endpoint, data: body);

      log("Response Status Code: ${response.statusCode}");
      log("Response Body: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception("Request failed with status: ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log("DioError Response: ${e.response?.data}");
        throw Exception("API error: ${e.response?.data}");
      } else {
        log("DioError Message: ${e.message}");
        throw Exception("Connection error: ${e.message}");
      }
    } catch (e) {
      log("General Error: $e");
      throw Exception("An unexpected error occurred.");
    }
  }

  Future<Vehicle?> getProduct(String endpoint) async {
    try {
      final response = await dio.get(endpoint);

      log("Response Status Code: ${response.statusCode}");
      log("Response Body: ${response.data}");

      if (response.statusCode == 200) {
        return Vehicle.fromJson(response.data);
      } else {
        throw Exception("Request failed with status: ${response.statusCode}");
      }
    } on DioException catch (e) {
      log("DioException: ${e.message}");
      if (e.response != null) {
        throw Exception("API error: ${e.response?.data}");
      } else {
        throw Exception("Connection error: ${e.message}");
      }
    } catch (e) {
      log("General Error: $e");
      throw Exception("An unexpected error occurred.");
    }
  }

  Future<Vehicle?> getProductsByCategory(String endpoint) async {
    const String categoryUrl =
        "https://test.vehup.com/api/vendor/get-vehicle-details/{vehicle_id}";
    try {
      final response = await dio.get(categoryUrl + endpoint);

      log("Response Status Code: ${response.statusCode}");
      log("Response Body: ${response.data}");

      if (response.statusCode == 200) {
        return Vehicle.fromJson(response.data);
      } else {
        throw Exception("Request failed with status: ${response.statusCode}");
      }
    } on DioException catch (e) {
      log("DioException: ${e.message}");
      if (e.response != null) {
        throw Exception("API error: ${e.response?.data}");
      } else {
        throw Exception("Connection error: ${e.message}");
      }
    }
  }
}

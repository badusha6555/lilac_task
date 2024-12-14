import 'package:flutter/material.dart';

import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:lilac_task/core/services.dart/login_services/login_services.dart';
import 'package:lilac_task/core/services.dart/vehicle_services.dart/vehicle_services.dart';
import 'package:lilac_task/data/models/vehicle.dart';

class VehicleProvider extends ChangeNotifier {
  final ApiServices apiServices = ApiServices();
  final LoginServices loginServices = LoginServices();

  Vehicle? vehicle;
  bool isLoading = false;

  Future<void> fetchProduct() async {
    isLoading = true;
    notifyListeners();

    try {
      final response =
          await apiServices.getProduct('/${loginServices.getToken()}');

      if (response != null) {
        vehicle = response;
        log("Fetched Product: ${vehicle!.data}");
      } else {
        log("No product data.");
      }
    } catch (e) {
      log("Error fetching product: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchvehiclesById() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await apiServices.getProductsByCategory('/');

      if (response != null) {
        vehicle = response;
        log("Fetched Product: ${vehicle!.data}");
      } else {
        log("No product data");
      }
    } catch (e) {
      log("Error fetching product: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchProductsOfDog() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await apiServices.getProductsByCategory('/dog');

      if (response != null) {
        vehicle = response;
        log("Fetched Product In Provider: ${vehicle!.data}");
      } else {
        log("No product data");
      }
    } catch (e) {
      log("Error fetching product: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

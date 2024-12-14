import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lilac_task/features/controllers/vehicle_controller/vehicle_controller.dart';
import 'package:provider/provider.dart';

class TotalVehicles extends StatefulWidget {
  const TotalVehicles({super.key});

  @override
  State<TotalVehicles> createState() => _TotalVehiclesState();
}

class _TotalVehiclesState extends State<TotalVehicles> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<VehicleProvider>(context, listen: false).fetchProduct();
      log("Fetching Vehicles ...");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VehicleProvider>(
      builder: (context, productProvider, child) {
        if (productProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final product = productProvider.vehicle;

        if (product == null || product.data == null || product.data!.isEmpty) {
          return const Center(
            child: Text('No Dog products available.'),
          );
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.0,
          ),
          padding: const EdgeInsets.all(10),
          itemCount: product.data!.length,
          itemBuilder: (context, index) {
            final productData = product.data![index];
            final productName = productData.id ?? 'No Title';

            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   PageRouteBuilder(
                //     pageBuilder: (context, animation, secondaryAnimation) =>
                //         ProductDetailsPage(
                //       description: product.data![index].productDescription![0],
                //       productName: productName,
                //       imageUrl: imageUrl,
                //       productCategory: productCategory,
                //     ),
                //     transitionsBuilder:
                //         (context, animation, secondaryAnimation, child) =>
                //             FadeTransition(
                //       opacity: animation,
                //       child: child,
                //     ),
                //     transitionDuration: const Duration(milliseconds: 500),
                //     reverseTransitionDuration:
                //         const Duration(milliseconds: 500),
                //   ),
                // );
              },
              child: Card(
                color: const Color.fromARGB(255, 253, 240, 222),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.data![index].year ?? 'No Title',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product.data![index].price ?? 'No Title',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lilac_task/features/controllers/login_controller/login_controller.dart';
import 'package:lilac_task/features/controllers/vehicle_controller/vehicle_controller.dart';
import 'package:lilac_task/features/view/bottombar/bottombar.dart';
import 'package:lilac_task/features/view/home/dashboard/dashboard.dart';
import 'package:lilac_task/features/view/home/requirements/add_requrement.dart';
import 'package:lilac_task/features/view/login/login.dart';
import 'package:lilac_task/features/view/splash/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VehicleProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Splash(),
        routes: {
          '/splash': (context) => const Splash(),
          '/login': (context) => Login(),
          '/dashboard': (context) => const Dashboard(),
          '/bottom': (context) => const Bottombar(),
          '/selectvehicle': (context) => const SelectVehicle(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_task/features/view/home/requirements/car_section.dart';

class SelectVehicle extends StatelessWidget {
  const SelectVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        title: Text(
          'What would you prefer to have?',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _optionSelection(Icons.directions_car, 'Car', () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VehicleRequirementScreen()));
          }),
          SizedBox(width: 20),
          _optionSelection(Icons.directions_bike_outlined, 'Bike', () {
            Navigator.pushNamed(context, '/select_bike');
          }),
        ],
      ),
    );
  }

  Widget _optionSelection(
      IconData icon, String label, GestureTapCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Color.fromRGBO(74, 16, 29, 1),
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(74, 16, 29, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

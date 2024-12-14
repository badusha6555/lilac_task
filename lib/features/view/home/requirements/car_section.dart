import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleRequirementScreen extends StatelessWidget {
  VehicleRequirementScreen({super.key});
  final List<String> brands = ['Brand A', 'Brand B', 'Brand C'];
  final List<String> years = ['2024', '2023', '2022', '2021'];
  final List<String> models = ['Model X', 'Model Y', 'Model Z'];
  final List<String> variants = ['Variant 1', 'Variant 2'];
  final List<String> fuels = ['Petrol', 'Diesel', 'Electric'];
  final List<String> colors = ['Red', 'Blue', 'White'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:
            Text('Vehicle requirement', style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDropdown('Brand *', brands),
              buildDropdown('Model *', models),
              buildDropdown('Variant *', variants),
              buildDropdown('Year *', years),
              SizedBox(height: 16),
              Text('Transmission *'),
              Row(
                children: [
                  buildTransmissionButton('Automatic', true),
                  SizedBox(width: 10),
                  buildTransmissionButton('Manual', false),
                ],
              ),
              SizedBox(height: 16),
              buildDropdown('Fuel *', fuels),
              buildDropdown('Color *', colors),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Color.fromRGBO(74, 16, 29, 1),
                ),
                onPressed: () {
                  print('Submit Button Pressed');
                },
                child: Text('Submit',
                    style:
                        GoogleFonts.poppins(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: SizedBox(),
              hint: Text('Select $label'),
              items: items
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
              onChanged: (value) {
                print('$label Selected: $value');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTransmissionButton(String text, bool isSelected) {
    return Expanded(
      child: Container(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isSelected ? Color.fromRGBO(74, 16, 29, 1) : Colors.white,
            side: BorderSide(
              color: Color.fromRGBO(74, 16, 29, 1),
            ),
            foregroundColor:
                isSelected ? Colors.white : Color.fromRGBO(74, 16, 29, 1),
          ),
          onPressed: () {
            print('$text Transmission Selected');
          },
          child: Text(text),
        ),
      ),
    );
  }
}

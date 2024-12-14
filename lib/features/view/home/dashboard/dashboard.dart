import 'package:flutter/material.dart';
import 'package:lilac_task/features/view/home/dashboard/total_vehicles.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        leading: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsPage())
              //   );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // mainAxisSpacing: 10,
                      crossAxisSpacing: 0,
                    ),
                    itemBuilder: (context, index) {
                      return (_buildGridItem(index));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(int index) {
    final List<Map<String, dynamic>> gridItems = [
      {
        "icon": Icons.directions_car,
        "count": "100",
        "label": "Total Vehicle",
        "color": Colors.teal
      },
      {
        "icon": Icons.book_online,
        "count": "50",
        "label": "Total Bookings",
        "color": Colors.green
      },
      {
        "icon": Icons.handshake,
        "count": "25",
        "label": "C2B Concept",
        "color": Colors.red
      },
      {
        "icon": Icons.local_offer,
        "count": "35",
        "label": "Vehicle for Sale",
        "color": Colors.blue
      },
    ];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TotalVehicles()),
        );
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(12),
        // elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: gridItems[index]["color"].withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                gridItems[index]["icon"],
                size: 36,
                color: gridItems[index]["color"],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              gridItems[index]["count"],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              gridItems[index]["label"],
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

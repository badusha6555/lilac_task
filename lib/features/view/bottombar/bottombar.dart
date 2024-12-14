import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:lilac_task/features/view/home/dashboard/dashboard.dart';
import 'package:lilac_task/features/view/home/messages/messages.dart';
import 'package:lilac_task/features/view/home/profile/profile.dart';
import 'package:lilac_task/features/view/home/requirements/requirements.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _currentIndex = 0;

  // Add a dummy placeholder for the "Sell" tab to align with BottomNavigationBarItems
  final _pages = [
    Dashboard(), // Index 0
    Messages(), // Index 1
    Container(), // Placeholder for "Sell" (Index 2)
    Requirements(), // Index 3
    Profile(), // Index 4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        fixedColor: const Color.fromRGBO(74, 16, 29, 1),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        elevation: 0,
        onTap: (value) {
          if (value != 2) {
            setState(() {
              _currentIndex = value;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(EneftyIcons.home_2_outline),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(EneftyIcons.message_2_outline), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(null), label: 'Sell'),
          BottomNavigationBarItem(
              icon: Icon(EneftyIcons.message_notif_outline),
              label: 'Requirement'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/sell');
        },
        child: const Icon(
          EneftyIcons.dollar_circle_outline,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: const Color.fromRGBO(74, 16, 29, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      body: Center(
        child: Text('Messages'),
      ),
    );
  }
}

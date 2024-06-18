import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MainApp());
}

// Root of the App. Needs to be a Stateless Widget
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:romyapp/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(), // Use the Home class as your home screen
    );
  }
}

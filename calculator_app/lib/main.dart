import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:  'CalculatorApp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Homepage(),
    );
  }
}



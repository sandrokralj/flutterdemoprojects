import 'package:flutter/material.dart';
import 'pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        fontFamily: "Montserrat",
        buttonColor: Colors.blue,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textTheme: ButtonTextTheme.primary,
        )
      ),
      home: HomePage(),
    );
  }
}

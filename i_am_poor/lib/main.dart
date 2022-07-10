import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.teal[600],
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        centerTitle: true,
        title: Text(
          'I Am Poor',
        ),
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/coal.png'),
        ),
      ),
    ),
  ));
}

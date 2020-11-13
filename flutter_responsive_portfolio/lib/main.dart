import 'package:flutter/material.dart';
import 'package:flutter_responsive_portfolio/profile_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,
        fontFamily: "GoogleSansRegular",

      ),
      home: ProfilePage(),
    );
  }
}

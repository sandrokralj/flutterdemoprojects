
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'providers/transactions.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  static const Map<int, Color> colorMap = {
    50: Color.fromRGBO(42, 54, 59, 0.1),
    100: Color.fromRGBO(42, 54, 59, 0.2),
    200: Color.fromRGBO(42, 54, 59, 0.3),
    300: Color.fromRGBO(42, 54, 59, 0.4),
    400: Color.fromRGBO(42, 54, 59, 0.5),
    500: Color.fromRGBO(42, 54, 59, 0.6),
    600: Color.fromRGBO(42, 54, 59, 0.7),
    700: Color.fromRGBO(42, 54, 59, 0.8),
    800: Color.fromRGBO(42, 54, 59, 0.9),
    900: Color.fromRGBO(42, 54, 59, 1.0),

  };

  static const MaterialColor _2A363B = MaterialColor(0xFF2A363B, colorMap);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Transactions(),
      child: MaterialApp(
        title: 'Personal Finance',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: _2A363B,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
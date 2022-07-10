import 'package:flutter/material.dart';
import 'package:weather_app/viewmodels/city_entry_viewmodel.dart';
import 'viewmodels/forecast_view_model.dart';
import 'views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CityEntryViewModel>(
        create: (_) => CityEntryViewModel()),
    ChangeNotifierProvider<ForecastViewModel>(
        create: (_) => ForecastViewModel()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Provider',
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
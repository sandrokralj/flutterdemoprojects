import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive/home_view.dart';
import 'package:flutter_responsive/home_view_test.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feelix_home/home_page_feelix.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(areSettingsEnabled: true, builder: (context) => MyApp()),
  );
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      title: 'Feelix App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePageFeelix(),
    );
  }
}

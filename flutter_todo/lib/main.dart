import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_todo/views/home_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
        areSettingsEnabled: false,
        builder: (context) => MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      title: 'ToDoApp',
      home: HomeView(),
    );
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeViewModel extends ChangeNotifier {
  String title = 'default';
  List<String> toDoList = [];
  TextEditingController textController = TextEditingController();
  int counter = 0;

  Widget responsiveValues(BuildContext context) {
    var fontSizes = getValueForScreenType<double>(
        context: context, mobile: 16.0, tablet: 32.0, watch: 8.0);
    var paddingValues = getValueForScreenType<double>(
      context: context,
      mobile: 50.0,
      tablet: 100.0,
      watch: 10.0,
      desktop: 40.0,
    );
    var colors = getValueForScreenType<MaterialColor>(
      context: context,
      mobile: Colors.blue,
      tablet: Colors.green,
      watch: Colors.yellow,
    );

    return Padding(
      padding: EdgeInsets.all(paddingValues),
      child: OrientationLayoutBuilder(
        portrait: (context) => Container(
          color: colors,
          child: Center(
            child: Text(
              'Hello World',
              style: TextStyle(fontSize: fontSizes, color: Colors.black),
            ),
          ),
        ),
        landscape: (context) => Container(
          color: Colors.red,
          child: Center(
            child: Text(
              'Hello World',
              style: TextStyle(fontSize: fontSizes, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  void initialise() {
    title = 'initialised';
    notifyListeners();
  }

  void addTextToList() {
    toDoList.insert(0, textController.text);
    textController.clear();
    notifyListeners();
  }


  void updateTitle() {
    counter++;
    title = 'Updated: $counter';
    notifyListeners();
  }
}
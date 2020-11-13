import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeViewModel extends ChangeNotifier {
  String title = 'default';
  List<String> toDoList = [];
  TextEditingController textController = TextEditingController();
  int counter = 0;
  final double smallFontSize = 2;
  final double smallIconSize = 2;
  final double bigFontSize = 2;
  final double bigIconSize = 2;



  void initialise() {
    title = 'initialised';
    notifyListeners();
  }

  void addTextToList() {
    toDoList.insert(0, textController.text);
    textController.clear();
    notifyListeners();
  }
}

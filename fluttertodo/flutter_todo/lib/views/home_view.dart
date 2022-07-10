import 'package:flutter/material.dart';
import 'package:flutter_todo/responsive/orientation_layout.dart';
import 'package:flutter_todo/responsive/screen_type_layout.dart';
import 'package:flutter_todo/views/home_view_tablet.dart';

import 'home_view_mobile.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Container(
      //width: orientation == Orientation.portrait ? 250 : 100,
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => HomeMobilePortrait(),
          landscape: (context) => HomeMobileLandscape(),
        ),
        //tablet: HomeMobilePortrait(),
      ),
    );
  }
}

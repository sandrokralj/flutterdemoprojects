import 'package:flutter/material.dart';
import 'package:flutter_responsive/app_bar/feelix_app_bar_tablet.dart';
import 'package:flutter_responsive/body_widgets/feelix_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePageFeelixTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            isPortrait ? const Size.fromHeight(55) : const Size.fromHeight(70),
        child: FeelixAppBarTablet(
          iconSize: isPortrait ? 50 : 55,
          color: Colors.amber,
          fontSize: isPortrait ? 36 : 44,
        ),
      ),
      body: FeelixTablet(),
    );
  }
}
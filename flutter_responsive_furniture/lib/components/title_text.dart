import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


class TitleText extends StatelessWidget {
  const TitleText({
    Key key, this.title,
  }) : super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {
    final double fontSize = getValueForScreenType<double>(
      context: context,
      mobile: 16,
      tablet: 20,
    );
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_responsive_portfolio/widgets/nav_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SocialInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              NavButton(
                text: "GitHub",
                onPressed: () {},
                color: Colors.blue,
              ),
              NavButton(
                text: "Facebook",
                onPressed: () {},
                color: Colors.blue,
              ),

              NavButton(
                text: "Twitter",
                onPressed: () {},
                color: Colors.blue,
              ),
            ],
          ),
          Text(
            "Sandro Sandor ©2020",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey
            ),
          ),
        ],
      ),
      mobile: (BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NavButton(
            text: "GitHub",
            onPressed: () {},
            color: Colors.blue,
          ),
          NavButton(
            text: "Facebook",
            onPressed: () {},
            color: Colors.blue,
          ),

          NavButton(
            text: "Twitter",
            onPressed: () {},
            color: Colors.blue,
          ),
          Text(
            "Sandro Sandor ©2020",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }
}

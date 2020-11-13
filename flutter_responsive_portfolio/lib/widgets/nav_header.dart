import 'package:flutter/material.dart';
import 'package:flutter_responsive_portfolio/widgets/mpdot.dart';
import 'package:flutter_responsive_portfolio/widgets/nav_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavHeader extends StatelessWidget {
  final MainAxisAlignment mainAlignment;

  const NavHeader({Key key, this.mainAlignment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop:(BuildContext context) => Row(
        mainAxisAlignment: mainAlignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MPDot(),
          //Spacer(),
          Row(
            children: <Widget>[
              NavButton(
                text: "About",
                onPressed: () {},
              ),
              NavButton(
                text: "Work",
                onPressed: () {},
              ),
              NavButton(
                text: "Contact",
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      mobile: (BuildContext context) => Row(
        mainAxisAlignment: mainAlignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MPDot(),
          //Spacer(),
        ],
      ),
    );
  }
}

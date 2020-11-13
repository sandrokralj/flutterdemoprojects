import 'package:flutter/material.dart';
import 'package:flutter_responsive_portfolio/widgets/body_widget.dart';
import 'package:flutter_responsive_portfolio/widgets/nav_button.dart';
import 'package:flutter_responsive_portfolio/widgets/nav_header.dart';
import 'package:flutter_responsive_portfolio/widgets/profile_info.dart';
import 'package:flutter_responsive_portfolio/widgets/social_info.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return ScreenTypeLayout.builder(
      // DESKTOP
      desktop: (BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
          ),
        ),
        body: BodyWidget(),
      ),
      // MOBILE
      mobile: (BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(20),
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
        ),
        body: BodyWidget(),
      ),
    );
  }
}

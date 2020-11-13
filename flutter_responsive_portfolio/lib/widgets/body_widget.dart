import 'package:flutter/material.dart';
import 'package:flutter_responsive_portfolio/widgets/nav_header.dart';
import 'package:flutter_responsive_portfolio/widgets/profile_info.dart';
import 'package:flutter_responsive_portfolio/widgets/social_info.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BodyWidget extends StatelessWidget {

  const BodyWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceTypeAlignment = getValueForScreenType<MainAxisAlignment>(
      context: context,
      mobile: MainAxisAlignment.center,
      desktop: MainAxisAlignment.spaceBetween
    );

    return SingleChildScrollView(
      child: AnimatedPadding(
        duration: Duration(seconds: 1),
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            NavHeader(mainAlignment: deviceTypeAlignment,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            ProfileInfo(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            SocialInfo(),
          ],
        ),
      ),
    );
  }
}

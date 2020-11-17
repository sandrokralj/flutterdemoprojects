import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_velocityx_portfolio/coolors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var nameWidget = 'Sandro\nKralj.'
        .text
        .white
        .xl6
        .lineHeight(1)
        .size(context.isMobile ? 15 : 20)
        .bold
        .make()
        .shimmer();

    return SafeArea(
      child: VxBox(
              child: VStack([
        ZStack([
          PictureWidget().p16(),
          Row(
            children: [
              VStack([
                if(context.isMobile)
                  50.heightBox else 10.heightBox,
                CustomAppBar().shimmer(
                  primaryColor: Coolers.accentColor,
                ),
                30.heightBox,
                nameWidget,
                20.heightBox,
                VxBox()
                    .color(Coolers.accentColor)
                    .size(60, 10)
                    .make()
                    .shimmer(primaryColor: Coolers.accentColor),
                30.heightBox,
                SocialAccounts(),
              ]).pSymmetric(h: context.percentWidth * 10, v: 32),
              Expanded(
                child: VxResponsive(
                  fallback: const Offstage(),
                  small: IntroductionWidget()
                      .pOnly(left: 120)
                      .h(context.percentHeight * 60),
                  medium: IntroductionWidget()
                      .pOnly(left: 120)
                      .h(context.percentHeight * 60),
                  large: IntroductionWidget()
                      .pOnly(left: 120)
                      .h(context.percentHeight * 60),
                ),
              ),
            ],
          ).w(context.screenWidth),
        ]),
      ]))
          .size(context.screenWidth, context.percentHeight * 60)
          .color(Coolers.secondaryColor)
          .make(),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        [
          "- Introduction".text.gray500.widest.sm.make(),
          10.heightBox,
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, \nsed do eiusmod tempor incididunt."
              .text
              .white
              .xl3
              .maxLines(5)
              .make()
              .w(context.isMobile
                  ? context.screenWidth
                  : context.percentWidth * 40),
          20.heightBox,
        ].vStack(),
        RaisedButton(
          onPressed: () {
            launch('https://google.com');
          },
          child: "Lorem ipsum dolor".text.make(),
          color: Coolers.accentColor,
          shape: Vx.roundedSm,
          hoverColor: Vx.blue800,
        ).h(50),
      ],
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class PictureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/pic2.png',
        fit: BoxFit.cover,
        height: context.percentHeight * 55,
        alignment: Alignment.center,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      AntDesign.codesquare,
      size: 50,
      color: Coolers.accentColor,
    );
  }
}

class SocialAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return [
      Icon(
        AntDesign.twitter,
        color: Colors.white,
      ).mdClick(() {
        launch("https://twitter.com");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.instagram,
        color: Colors.white,
      ).mdClick(() {
        launch("https://instagram.com");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.youtube,
        color: Colors.white,
      ).mdClick(() {
        launch("https://youtube.com");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.github,
        color: Colors.white,
      ).mdClick(() {
        launch("https://github.com");
      }).make(),
    ].hStack();
  }
}

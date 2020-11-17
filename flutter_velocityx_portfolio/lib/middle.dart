import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MiddleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Vx.blue700,
      child: Flex(
        direction: context.isMobile ? Axis.vertical : Axis.horizontal,
        children: [
          'All Creative Work, \n'
              .richText
              .withTextSpanChildren(
                ['Selected projects.'.textSpan.yellow400.make()],
              )
              .xl4
              .white
              .make(),
          20.widthBox,
          Expanded(
            child: VxSwiper(
              items: [
                ProjectWidget(title: 'Some Project'),
                ProjectWidget(title: 'Something'),
                ProjectWidget(title: 'Random Values'),
                ProjectWidget(title: 'Just For Show'),
                ProjectWidget(title: 'Hello World 123'),
              ],
              height: 170,
              enlargeCenterPage: true,
              viewportFraction: context.isMobile ? 0.75 : 0.4,
              autoPlay: true,
              autoPlayAnimationDuration: 2.seconds,
            ),
          ),
        ],
      ).p64().h(context.isMobile ? 500 : 300),
    );
  }
}

class ProjectWidget extends StatelessWidget {

  final String title;

  const ProjectWidget({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return title
        .text
        .bold
        .white
        .xl
        .wide
        .center
        .make()
        .box
        .p8
        .roundedLg
        .alignCenter
        .square(200)
        .neumorphic(
        color: Vx.blue700, elevation: 5, curve: VxCurve.flat)
        .make()
        .p16();
  }
}


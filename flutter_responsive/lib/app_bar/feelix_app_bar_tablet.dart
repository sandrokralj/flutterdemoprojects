import 'package:flutter/material.dart';

class FeelixAppBarTablet extends StatelessWidget {
  final double iconSize;
  final Color color;
  final double fontSize;
  final EdgeInsetsGeometry paddingSize;
  const FeelixAppBarTablet(
      {Key key, this.iconSize, this.color, this.fontSize, this.paddingSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      title: Text(
        'Home Feelix',
        style: TextStyle(
          fontSize: fontSize,
          letterSpacing: 2,
        ),
      ),
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 0, 10),
        child: GestureDetector(
          onTap: () {
            print('Profile button');
          },
          child: Icon(Icons.account_circle, size: iconSize),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 25, 10),
          child: GestureDetector(
            onTap: () {
              print('Notifications');
            },
            child: Icon(Icons.notifications_none, size: iconSize),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 0, 10),
          child: GestureDetector(
            onTap: () {
              print('More');
            },
            child: Icon(
              Icons.more_vert,
              size: iconSize,
            ),
          ),
        ),
      ],
    );
  }
}

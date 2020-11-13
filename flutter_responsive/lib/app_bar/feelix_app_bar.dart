import 'package:flutter/material.dart';

class FeelixAppBar extends StatelessWidget {
  final double iconSize;
  final Color color;
  final double fontSize;
  const FeelixAppBar({Key key, this.iconSize, this.color, this.fontSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      title: Text(
        'Home Feelix',
        style: TextStyle(fontSize: fontSize),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          print('Profile button');
        },
        child: Icon(
          Icons.account_circle,
          size: iconSize,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 1),
          child: GestureDetector(
            onTap: () {
              print('Notifications');
            },
            child: Icon(
              Icons.notifications_none,
              size: iconSize,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 1),
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

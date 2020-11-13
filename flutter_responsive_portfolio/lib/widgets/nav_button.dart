import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;
  final Icons icon;

  const NavButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.blueAccent, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(text),
      borderSide: BorderSide(
        color: color,
      ),
      onPressed: onPressed,
      highlightedBorderColor: color,
    );
  }
}

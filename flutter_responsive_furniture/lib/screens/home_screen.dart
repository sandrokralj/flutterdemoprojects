import 'package:flutter/material.dart';
import 'package:flutter_responsive_furniture/constants.dart';
import 'package:flutter_responsive_furniture/screens/components/body.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var defaultSize = MediaQuery.of(context).orientation == Orientation.landscape ;
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/menu.svg',),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/icons/scan.svg'),
          onPressed: () {},
        ),
        Center(
          child: Text(
            'Scan',
            style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold,),
          ),
        ),
        SizedBox(width: 10,)
      ],
    );
  }
}

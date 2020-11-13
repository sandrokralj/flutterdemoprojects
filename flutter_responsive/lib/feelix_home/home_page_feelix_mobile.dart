import 'package:flutter/material.dart';
import 'package:flutter_responsive/app_bar/feelix_app_bar.dart';
import 'package:flutter_responsive/app_bar/feelix_app_bar_tablet.dart';
import 'package:flutter_responsive/body_widgets/feelix_mobile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePageFeelixMobile extends StatelessWidget {
  HomePageFeelixMobile({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var feelixAppBar = getValueForScreenType<StatelessWidget>(
      context: context,
      mobile: FeelixAppBar(
        iconSize: isPortrait ? 26 : 36,
        color: Colors.amber,
        fontSize: isPortrait ? ScreenUtil().setSp(22, allowFontScalingSelf: true) : ScreenUtil().setSp(32, allowFontScalingSelf: true),
      ),
      tablet: FeelixAppBarTablet(
        iconSize: isPortrait ? 50 : 55,
        color: Colors.amber,
        fontSize: isPortrait ? 36 : 44,
      ),
    );
    var preferredSize = getValueForScreenType<Size>(
      context: context,
      mobile: isPortrait ? const Size.fromHeight(30) : const Size.fromHeight(55),
      tablet: isPortrait ? const Size.fromHeight(55) : const Size.fromHeight(70),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: feelixAppBar,
      ),
      body: FeelixMobile(),
    );
  }
}
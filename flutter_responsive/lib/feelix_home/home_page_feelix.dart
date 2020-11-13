import 'package:flutter/material.dart';
import 'package:flutter_responsive/feelix_home/home_page_feelix_tablet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'home_page_feelix_mobile.dart';

class HomePageFeelix extends StatelessWidget {
  HomePageFeelix({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, designSize: Size(width, height), allowFontScaling: true);
    return Container(
      child: ScreenTypeLayout(
        mobile: HomePageFeelixMobile(),
        tablet: HomePageFeelixMobile(),
      ),
    );
  }
}

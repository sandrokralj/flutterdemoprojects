import 'package:flutter/material.dart';
import 'package:flutter_responsive/viewmodels/home_view_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'base_model_widget.dart';

class HomeViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    ScreenUtil.init(context,
        designSize: Size(width.toDouble(), height.toDouble()),
        allowFontScaling: true);
    var fontSizes = getValueForScreenType<double>(
        context: context, mobile: 16.0, tablet: 32.0, watch: 10.0);
    var paddingValues = getValueForScreenType<double>(
      context: context,
      mobile: 50.0,
      tablet: 100.0,
      watch: 15.0,
      desktop: 40.0,
    );
    var colors = getValueForScreenType<MaterialColor>(
      context: context,
      mobile: Colors.blue,
      tablet: Colors.green,
      watch: Colors.yellow,
    );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(paddingValues),
        child: OrientationLayoutBuilder(
          portrait: (context) => Container(
            color: colors,
            child: Center(
              child: Text(
                'Hello World',
                style: TextStyle(
                    fontSize: ScreenUtil()
                        .setSp(fontSizes, allowFontScalingSelf: true),
                    color: Colors.black),
              ),
            ),
          ),
          landscape: (context) => Container(
            color: Colors.red,
            child: Center(
              child: Text(
                'Hello World',
                style: TextStyle(fontSize: fontSizes, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

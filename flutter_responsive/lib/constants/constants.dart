import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Constants {
  dynamic isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  double aspectRatioHomePage(BuildContext context) => getValueForScreenType<double>(
        context: context,
        mobile: 1,
        tablet: isPortrait(context) ? 1.6 : 0.75,
      );

  double aspectRatioProfile(BuildContext context) => getValueForScreenType<double>(
    context: context,
    mobile: isPortrait(context) ? 1.2 : 1.27,
    tablet: isPortrait(context) ? 1.6 : 0.72,
  );

  double profilePageAvatarRadius(BuildContext context) => getValueForScreenType<double>(
    context: context,
    mobile: isPortrait(context) ? 125 : 150,
    tablet: isPortrait(context) ? 175 : 200,
  );

  double profilePageSmallAvatarRadius(BuildContext context) => getValueForScreenType<double>(
    context: context,
    mobile: isPortrait(context) ? 40 : 40,
    tablet: isPortrait(context) ? 60 : 60,
  );

  double cameraIconSize(BuildContext context) => getValueForScreenType<double>(
    context: context,
    mobile: isPortrait(context) ? 55 : 55,
    tablet: isPortrait(context) ? 70 : 70,
  );



  double aspectRatioHomeButtons(BuildContext context) =>
      getValueForScreenType<double>(
        context: context,
        mobile: isPortrait(context) ? 1.4 : 1.6,
        tablet: 1,
      );

  double iconSize(BuildContext context) => getValueForScreenType<double>(
        context: context,
        tablet: isPortrait(context) ? 70 : 80,
        mobile: isPortrait(context) ? 32 : 50,
      );

  int flexSize(BuildContext context) => getValueForScreenType<int>(
        context: context,
        mobile: isPortrait(context) ? 6 : 3,
        tablet: isPortrait(context) ? 8 : 10,
      );

  double fontSize(BuildContext context) => getValueForScreenType<double>(
        context: context,
        tablet: isPortrait(context)
            ? ScreenUtil().setSp(38, allowFontScalingSelf: true)
            : ScreenUtil().setSp(40, allowFontScalingSelf: true),
        mobile: isPortrait(context)
            ? ScreenUtil().setSp(32, allowFontScalingSelf: true)
            : ScreenUtil().setSp(36, allowFontScalingSelf: true),
      );

  double fontSizeProfilePage(BuildContext context) => getValueForScreenType<double>(
    context: context,
    tablet: isPortrait(context) ? ScreenUtil().setSp(38, allowFontScalingSelf: true) : ScreenUtil().setSp(40, allowFontScalingSelf: true),
    mobile: isPortrait(context) ? ScreenUtil().setSp(24, allowFontScalingSelf: true) : ScreenUtil().setSp(32, allowFontScalingSelf: true),
  );

  CrossAxisAlignment crossAxisAlignment(BuildContext context) =>
      getValueForScreenType<CrossAxisAlignment>(
        context: context,
        mobile: CrossAxisAlignment.start,
        tablet: CrossAxisAlignment.center,
      );

  double radius(BuildContext context) => getValueForScreenType<double>(
        context: context,
        mobile: isPortrait(context) ? 125 : 150,
        tablet: isPortrait(context) ? 175 : 200,
      );
}

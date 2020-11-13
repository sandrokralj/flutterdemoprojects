import 'package:flutter/material.dart';
import 'package:flutter_responsive/viewmodels/home_view_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_responsive/home_view_test.dart';
import 'package:flutter_responsive/base_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context) => ScreenTypeLayout(
        mobile: OrientationLayoutBuilder(
          portrait: (context) => HomeViewTest(),
          landscape: (context) => HomeViewTest(),
        ),
      ),
    );
  }
}

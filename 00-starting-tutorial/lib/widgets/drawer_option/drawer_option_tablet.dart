import 'package:flutter/material.dart';
import 'package:responsive_architecture/datamodels/drawer_item_data.dart';
import 'package:responsive_architecture/widgets/base_model_widget.dart';

class DrawerOptionTabletPortrait extends BaseModelWidget<DrawerItemData> {
  @override
  Widget build(BuildContext context, DrawerItemData data) {
    return Container(
      width: 152,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            data.iconData,
            size: 45,
          ),
          Text(
            data.title,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class DrawerOptionTabletLandscape extends BaseModelWidget<DrawerItemData> {
  @override
  Widget build(BuildContext context, DrawerItemData data) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      child: Icon(data.iconData),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_responsive_furniture/constants.dart';
import 'package:flutter_responsive_furniture/models/categories.dart';
import 'package:flutter_responsive_furniture/models/product.dart';
import 'package:flutter_responsive_furniture/screens/details/components/body.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  final Category category;

  const DetailsScreen({Key key, @required this.product, this.category}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var orientation =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var defaultSize = getValueForScreenType<double>(
      context: context,
      mobile: orientation ? height * 0.024 : width * 0.024,
      tablet: orientation ? height * 0.024 : width * 0.024,
    );
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(context, defaultSize),
      body: DetailsBody(product: product, category: category,),
    );
  }

  AppBar buildAppBar(BuildContext context, double defaultSize) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/arrow-long-left.svg'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/icons/bag.svg'),
          onPressed: () {

          },
        ),
        SizedBox(
          width: defaultSize,
        ),
      ],
    );
  }
}

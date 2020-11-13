import 'package:flutter/material.dart';
import 'package:flutter_responsive_furniture/constants.dart';
import 'package:flutter_responsive_furniture/models/categories.dart';
import 'package:flutter_responsive_furniture/models/product.dart';
import 'package:flutter_responsive_furniture/screens/details/components/product_descrpition.dart';
import 'package:flutter_responsive_furniture/screens/details/components/product_info.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DetailsBody extends StatelessWidget {
  final Product product;
  final Category category;

  const DetailsBody({Key key, this.product, this.category}) : super(key: key);

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
    String id = '';

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: orientation ? width : height - AppBar().preferredSize.height,
        child: Stack(
          children: [
            ProductInfo(
              product: product,
            ),
            Positioned(
              top: defaultSize * 37.5,
              left: 0,
              right: 0,
              child: ProductDescription(
                product: product,
                press: () {},
              ),
            ),
            Positioned(
              top: defaultSize * 9.5,
              right: -defaultSize * 2.5,
              child: Hero(
                tag: product.id,
                child: Image.network(
                  product.image,
                  height: defaultSize * 37.8,
                  width: defaultSize * 38,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

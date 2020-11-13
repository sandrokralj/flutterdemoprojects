import 'package:flutter/material.dart';
import 'package:flutter_responsive_furniture/models/product.dart';
import 'package:flutter_responsive_furniture/screens/components/product_card.dart';
import 'package:flutter_responsive_furniture/screens/details/details_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RecommendedProduct extends StatelessWidget {
  const RecommendedProduct({
    Key key,
    this.products,
  }) : super(key: key);

  final List<Product> products;

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

    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: orientation ? 4 : 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.693,
        ),
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
          press: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 1000),
                    pageBuilder: (_, __, ___) =>
                        DetailsScreen(product: products[index])));
          },
        ),
      ),
    );
  }
}

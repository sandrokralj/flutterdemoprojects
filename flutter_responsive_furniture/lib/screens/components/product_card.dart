import 'package:flutter/material.dart';
import 'package:flutter_responsive_furniture/components/title_text.dart';
import 'package:flutter_responsive_furniture/models/product.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

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
    return GestureDetector(
      onTap: press,
      child: Container(
        width: defaultSize * 14.5,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/spinner.gif',
                    image: product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultSize,
                ),
                child: TitleText(
                  title: product.title,
                ),
              ),
              SizedBox(
                height: defaultSize / 2,
              ),
              Text(
                '\$${product.price}',
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

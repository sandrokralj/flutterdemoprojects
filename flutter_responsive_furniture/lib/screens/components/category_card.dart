import 'package:flutter/material.dart';
import 'package:flutter_responsive_furniture/components/title_text.dart';
import 'package:flutter_responsive_furniture/models/categories.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../constants.dart';



class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key, @required this.category, this.press,
  }) : super(key: key);

  final Category category;
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
      child: Padding(
        padding: EdgeInsets.all(defaultSize * 2),
        child: SizedBox(
          width: defaultSize * 20.5,
          child: AspectRatio(
            aspectRatio: 0.83,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                ClipPath(
                  clipper: CategoryCustomShape(),
                  child: AspectRatio(
                    aspectRatio: 1.025,
                    child: Container(
                      padding: EdgeInsets.all(defaultSize * 2),
                      color: kSecondaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TitleText(title: category.title,),
                          SizedBox(height: defaultSize,),
                          Text(
                            '${category.numOfProducts} + Products',
                            style: TextStyle(
                              color: kTextColor.withOpacity(0.6),

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AspectRatio(
                    aspectRatio: 1.15,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/spinner.gif',
                      image: category.image,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;

    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

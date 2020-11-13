import 'package:flutter/material.dart';
import 'package:flutter_responsive_furniture/components/title_text.dart';
import 'package:flutter_responsive_furniture/constants.dart';
import 'package:flutter_responsive_furniture/models/categories.dart';
import 'package:flutter_responsive_furniture/models/product.dart';
import 'package:flutter_responsive_furniture/screens/components/product_card.dart';
import 'package:flutter_responsive_furniture/screens/components/recommended_product.dart';
import 'package:flutter_responsive_furniture/services/fetchCategories.dart';
import 'package:flutter_responsive_furniture/services/fetchProducts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'categories.dart';
import 'category_card.dart';

class Body extends StatelessWidget {
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
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(title: 'Browse by Categories'),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(
                      categories: snapshot.data,
                    )
                  : Center(child: Image.asset('assets/ripple.gif')),
            ),
            Divider(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(
                title: 'Recommended For You',
              ),
            ),
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData ? RecommendedProduct(
                  products: snapshot.data,
                ) : Center(
                  child: Image.asset(
                    'assets/ripple.gif'
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


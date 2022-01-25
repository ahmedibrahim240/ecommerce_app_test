import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/screens/product_screen/product_widget/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Productmodels product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: ProductImageCard(product: product),
            ),
            Expanded(
              flex: 5,
              child: ProductDetailsContainer(product: product),
            ),
            Expanded(
              child: PriceCard(
                product: product,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

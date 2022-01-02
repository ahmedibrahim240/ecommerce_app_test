import 'package:ecommerce_app/core/services/network_services/network_sensitive.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'product_widget/product_widget.dart';

class ProductScreen extends StatelessWidget {
  final ProductModels product;

  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NetworkSensitive(
        child: ProductBody(
          product: product,
        ),
      ),
    );
  }
}

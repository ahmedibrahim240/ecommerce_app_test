import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cutom_widget.dart';

class AddtoCartButtom extends StatelessWidget {
  const AddtoCartButtom({
    Key? key,
    required this.product,
    this.isFavourite = false,
  }) : super(key: key);
  final Productmodels product;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductControllers>(
      builder: (controller) => CustomButtom(
        bgColor: Colors.transparent,
        margin: (isFavourite)
            ? null
            : EdgeInsets.symmetric(
                vertical: defaultSize * 1.2,
                horizontal: defaultSize * 1.2,
              ),
        child: Icon(
          (!product.inCart!)
              ? Icons.add_shopping_cart
              : Icons.remove_shopping_cart,
          color: (!product.inCart!) ? kPrimaryColor : Colors.redAccent,
        ),
        onPreessed: () {
          if (product.inCart!) {
            cartContllors.delateCartProduct(
              product.productId,
            );
          } else {
            cartContllors.addCartProduct(
              CartFireBaseModel(
                productId: product.productId,
                quantity: 1,
                dateCreated: Timestamp.now(),
              ),
            );

            controller.updataInCartProduct(
              inCart: true,
              type: 'id',
              id: product.productId!,
            );
          }
        },
      ),
    );
  }
}

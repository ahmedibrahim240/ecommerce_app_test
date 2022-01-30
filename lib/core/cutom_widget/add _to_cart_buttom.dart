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
  }) : super(key: key);
  final Productmodels product;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductControllers>(
      builder: (controller) => CustomButtom(
        margin: EdgeInsets.symmetric(
          vertical: defaultSize * 1.2,
          horizontal: defaultSize * 1.2,
        ),
        child: Icon(
          (!product.inCart!)
              ? Icons.add_shopping_cart
              : Icons.remove_shopping_cart,
          color: (!product.inCart!) ? kPrimaryColor : Colors.redAccent,
        ),

        // CustomText(
        //   text: (!product.inCart!) ? "Add to Cart" : "Remove from Cart",
        //   color: Colors.white,
        //   fontSize: 12,
        //   alignment: Alignment.center,
        // ),
        onPreessed: () {
          if (product.inCart!) {
            cartContllors.delateProduct(
              product: product,
            );
          } else {
            cartContllors.addProduct(
              CartItemmodels(
                image: product.image,
                productId: product.productId,
                quantity: 1,
                price: product.price,
                title: product.title,
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

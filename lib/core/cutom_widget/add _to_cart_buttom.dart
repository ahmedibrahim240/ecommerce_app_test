import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/best_selling_controllers%20.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cutom_widget.dart';

class AddtoCartButtom extends StatelessWidget {
  const AddtoCartButtom({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModels product;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BestSellingControllers>(
      builder: (controller) => CustomButtom(
        bgColor: (!product.inCart!) ? kPrimaryColor : Colors.redAccent,
        margin: EdgeInsets.symmetric(
          vertical: defaultSize * 1.2,
          horizontal: defaultSize * 1.2,
        ),
        child: CustomText(
          text: (!product.inCart!) ? "Add to Cart" : "Remove from Cart",
          color: Colors.white,
          fontSize: 12,
          alignment: Alignment.center,
        ),
        onPreessed: () {
          if (product.inCart!) {
            cartContllors.delateProduct(product.id!);
            bestSellingControllers.updataProduct(
              inCart: false,
              type: 'id',
              id: product.id,
            );
          } else {
            cartContllors.addProduct(
              CartProductMoldes(
                tilte: product.title,
                image: product.image,
                price: product.price,
                productId: product.id,
                quantity: 1,
              ),
            );
            bestSellingControllers.updataProduct(
              inCart: true,
              type: 'id',
              id: product.id,
            );
          }
        },
      ),
    );
  }
}

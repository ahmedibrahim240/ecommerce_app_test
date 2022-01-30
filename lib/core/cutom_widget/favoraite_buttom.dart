import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'cutom_widget.dart';

class FavoraiteButtom extends StatelessWidget {
  const FavoraiteButtom({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Productmodels product;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductControllers>(
      builder: (controller) => CircleButton(
        onPressed: () {
          if (!product.isFavorite!) {
            favoritesConttroller.addFavoriteProdcut(
              product.productId!,
            );
          } else {
            favoritesConttroller.removeFavoriteProdcut(
              product.productId!,
            );
          }
          productControllers.updateIsForiteProduct(
            isFavorite: !product.isFavorite!,
            type: "id",
            id: product.productId,
          );
        },
        icon: (product.isFavorite!)
            ? FontAwesomeIcons.solidHeart
            : FontAwesomeIcons.heart,
        iconSize: defaultSize * 3.5,
        iconColor: (product.isFavorite!) ? Colors.red : Colors.black,
        bgColor: Colors.white,
      ),
    );
  }
}

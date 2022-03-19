import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'cutom_widget.dart';

class FavoraiteButtom extends GetWidget<AccountController> {
  const FavoraiteButtom({
    Key? key,
    required this.product,
    this.isViewProduct = false,
  }) : super(key: key);
  final Productmodels product;
  final bool isViewProduct;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductControllers>(
      builder: (procontroller) => CircleButton(
        onPressed: () {
          if (!product.isFavorite!) {
            FavouriteModels favourite = new FavouriteModels(
              productId: product.productId,
              dateCreated: Timestamp.now(),
            );
            favoritesConttroller.addFavoriteProdcut(
              favourite,
            );
          } else {
            favoritesConttroller.removeFavoriteProdcut(
              product.productId!,
            );
          }
        },
        icon: (product.isFavorite!)
            ? FontAwesomeIcons.solidHeart
            : FontAwesomeIcons.heart,
        iconSize: defaultSize * 3.5,
        iconColor: (product.isFavorite! || isViewProduct)
            ? Colors.red
            : (controller.darkMode.value)
                ? Colors.white
                : Colors.black,
        bgColor: Colors.transparent,
      ),
    );
  }
}

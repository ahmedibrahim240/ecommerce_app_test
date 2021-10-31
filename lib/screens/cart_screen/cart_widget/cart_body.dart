import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/cart_controllers.dart';
import 'package:ecommerce_app/core/cutom_widget/custom_text.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'cart_widget.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartContllors>(
      builder: (controller) {
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _BuildCartItemList(),
              ),
              CheckoutCard(),
            ],
          ),
        );
      },
    );
  }
}

class _BuildCartItemList extends StatelessWidget {
  const _BuildCartItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (cartContllors.cartItemList.isEmpty) {
          return _EmptyCart();
        } else {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: cartContllors.cartItemList.length,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            itemBuilder: (context, index) {
              CartProductMoldes product = cartContllors.cartItemList[index];

              return CartItemCard(product: product, index: index);
            },
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 10),
          );
        }
      },
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            emptyCartJson,
            height: 200,
            width: 200,
          ),
          Center(
            child: CustomText(
              text: 'Cart Empty',
              alignment: Alignment.center,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce_app/core/constans/constans.dart';

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
          return
              // Column(
              //   children: authControllers.usermodels.value.cart
              //       .map<Widget>(
              //         (product) => Padding(
              //           padding: EdgeInsets.all(defaultSize),
              //           child: CartItemCard(product: product),
              //         ),
              //       )
              //       .toList(),
              // );

              ListView.separated(
            shrinkWrap: true,
            itemCount: cartContllors.cartItemList.length,
            padding: EdgeInsets.fromLTRB(
                defaultSize, defaultSize * 2, defaultSize, 0),
            itemBuilder: (context, index) {
              CartItemmodels product =
                  authControllers.usermodels.value.cart[index];

              return CartItemCard(product: product, index: index);
            },
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: defaultSize),
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
            height: defaultSize * 23.2,
            width: defaultSize * 23.2,
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

import 'package:flutter/material.dart';
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
            child: BuildCartItemList(),
          ),
          CheckoutCard(),
        ],
      ),
    );
  }
}

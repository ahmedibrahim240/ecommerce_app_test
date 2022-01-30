import 'package:ecommerce_app/core/constans/constans.dart';

import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'cart_widget.dart';

class BuildCartItemList extends StatelessWidget {
  const BuildCartItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (cartContllors.cartItemList.isEmpty) {
          return EmptyCart();
        } else {
          return (cartContllors.reloadPage.value)
              ? Container(
                  child: Center(
                    child: SpinKitFadingGrid(
                      color: kPrimaryColor.withOpacity(0.7),
                      size: 70,
                    ),
                  ),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  itemCount: cartContllors.cartItemList.length,
                  padding: EdgeInsets.fromLTRB(
                    defaultSize,
                    defaultSize * 2,
                    defaultSize,
                    0,
                  ),
                  itemBuilder: (context, index) {
                    CartItemmodels product =
                        authControllers.usermodels.value.cart[index];

                    return CartItemCard(
                      product: product,
                      index: index,
                    );
                  },
                  separatorBuilder: (
                    BuildContext context,
                    int index,
                  ) =>
                      SizedBox(
                    height: defaultSize,
                  ),
                );
        }
      },
    );
  }
}

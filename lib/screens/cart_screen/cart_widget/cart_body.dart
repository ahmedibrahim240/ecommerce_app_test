import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';

import 'package:ecommerce_app/models/models.dart';
import 'package:get/get.dart';
import 'cart_widget.dart';

class CartBody extends GetWidget<AccountController> {
  const CartBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: Get.put<CartContllors>(CartContllors()),
      builder: (CartContllors cartCont) {
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: (cartCont.cartItemList.isEmpty)
                    ? EmptyData(
                        icon: emptyCartJson,
                        text: 'Cart Empty',
                      )
                    : _biuldCartItemList(cartCont),
              ),
              CheckoutCard(),
            ],
          ),
        );
      },
    );
  }

  _biuldCartItemList(CartContllors cartCont) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: cartCont.cartItemList.length,
      padding: EdgeInsets.fromLTRB(
        defaultSize,
        defaultSize * 2,
        defaultSize,
        0,
      ),
      itemBuilder: (context, index) {
        CartItemmodels product = cartCont.cartItemList[index];

        return _buildcartItemCard(context, product);
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

  _buildcartItemCard(BuildContext context, CartItemmodels product) {
    return Container(
      height: defaultSize * 15,
      decoration: controller.darkMode.value
          ? BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.grey.withOpacity(.5),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            )
          : null,
      child: Row(
        children: [
          _buidCartItemImage(context, product),
          SizedBox(width: defaultSize),
          _viewItemData(product),
        ],
      ),
    );
  }

  _viewItemData(CartItemmodels product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: defaultSize),
        CustomText(
          text: product.title ?? '',
          fontSize: 16,
          maxLines: 1,
        ),
        SizedBox(height: defaultSize),
        CustomText(
          text: '\$${product.price!}',
          color: kPrimaryColor,
        ),
        SizedBox(height: defaultSize * 2),
        _addAndMinimizeButtom(product)
      ],
    );
  }

  _addAndMinimizeButtom(CartItemmodels product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.chevron_left,
          ),
          onPressed: () {
            cartContllors.increaseQuntitiy(product);
          },
        ),
        CustomText(
          text: product.quantity.toString(),
        ),
        IconButton(
          icon: Icon(
            Icons.chevron_right,
          ),
          onPressed: () {
            if (product.quantity == 1) {
              cartContllors.delateCartProduct(product.productId);
            } else {
              cartContllors.decreaseQuantity(
                product,
              );
            }
          },
        ),
      ],
    );
  }

  _buidCartItemImage(BuildContext context, CartItemmodels product) {
    return Container(
      height: defaultSize * 14.5,
      width: defaultSize * 14.5,
      child: ClipRRect(
        borderRadius: controller.darkMode.value
            ? const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )
            : const BorderRadius.all(
                Radius.circular(10),
              ),
        child: CustomCachedNetworkImage(
          context: context,
          url: product.image!,
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/account_controller.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemCard extends GetWidget<AccountController> {
  const CartItemCard({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final CartItemmodels product;
  final int index;

  @override
  Widget build(BuildContext context) {
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
          Container(
            height: defaultSize * 13.5,
            width: defaultSize * 13.5,
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
          ),
          SizedBox(width: defaultSize),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: defaultSize),
              CustomText(
                text: product.tilte ?? '',
                fontSize: 16,
                maxLines: 1,
              ),
              SizedBox(height: defaultSize),
              CustomText(
                text: '\$${product.price!}',
                color: kPrimaryColor,
              ),
              SizedBox(height: defaultSize * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                    ),
                    onPressed: () {
                      cartContllors.increaseQuantity(index);
                    },
                  ),
                  Obx(
                    () => Padding(
                      padding: EdgeInsets.all(defaultSize),
                      child: CustomText(
                        text: cartContllors.cartItemList[index].quantity
                            .toString(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                    ),
                    onPressed: () {
                      cartContllors.decreaseQuantity(
                        index: index,
                        item: cartContllors.cartItemList[index],
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

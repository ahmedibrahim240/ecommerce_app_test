import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/account_controller.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/cart_product_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAndMinimzeContainer extends GetWidget<AccountController> {
  final CartProductMoldes product;
  final Function add;
  final Function minimize;
  final int index;
  const AddAndMinimzeContainer({
    required this.index,
    Key? key,
    required this.product,
    required this.add,
    required this.minimize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: defaultSize * 13.2,
      height: defaultSize * 3,
      color: controller.darkMode.value ? Colors.black12 : Colors.grey.shade200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () => add(),
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.add,
              color: controller.darkMode.value ? Colors.white : Colors.black,
              size: 20,
            ),
          ),
          Obx(
            () {
              cartContllors.getAllProduct();
              return CustomText(
                text: cartContllors.cartItemList[index].quantity.toString(),
                fontSize: 14,
              );
            },
          ),
          IconButton(
            onPressed: () => minimize(),
            padding: EdgeInsets.only(bottom: 20),
            icon: Icon(
              Icons.minimize,
              color: controller.darkMode.value ? Colors.white : Colors.black,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

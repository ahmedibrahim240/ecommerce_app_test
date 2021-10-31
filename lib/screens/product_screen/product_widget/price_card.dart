import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/account_controller.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceCard extends GetWidget<AccountController> {
  const PriceCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModels product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: controller.darkMode.value ? Colors.black12 : Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "PRICE",
                  color: kGrayColor,
                  alignment: Alignment.centerLeft,
                  fontSize: 14,
                ),
                SizedBox(height: 5),
                CustomText(
                  text: "\$${product.price}",
                  color: kPrimaryColor,
                  alignment: Alignment.centerLeft,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Expanded(
            child: AddtoCartButtom(
              product: product,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce_app/core/controllers/account_controller.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsContainer extends StatelessWidget {
  const ProductDetailsContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModels product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductStylesCart(product: product),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomText(
                    text: 'Details',
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    textOverflow: null,
                    textHeight: 3,
                    text: product.descraptions ?? "",
                    fontSize: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductStylesCart extends StatelessWidget {
  const ProductStylesCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModels product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
      child: Row(
        children: [
          Expanded(
            child: _BuildProductStyels(
              product: product,
              lable: 'Size',
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _BuildProductStyels(
              product: product,
              lable: 'Color',
              isColor: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildProductStyels extends GetWidget<AccountController> {
  final bool isColor;
  final String lable;

  const _BuildProductStyels({
    Key? key,
    required this.product,
    this.isColor = false,
    required this.lable,
  }) : super(key: key);

  final ProductModels product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: lable, fontSize: 14),
            (isColor)
                ? Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: product.color,
                      border: controller.darkMode.value
                          ? Border.all(
                              width: 1,
                              color: Colors.grey.withOpacity(.5),
                            )
                          : null,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  )
                : CustomText(
                    text: product.size ?? '',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
          ],
        ),
      ),
    );
  }
}

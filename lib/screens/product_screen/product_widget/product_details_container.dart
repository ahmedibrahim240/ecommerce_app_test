import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/account_controller.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsContainer extends StatelessWidget {
  const ProductDetailsContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Productmodels product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: defaultSize),
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

  final Productmodels product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        defaultSize / 2,
        defaultSize * 2,
        defaultSize / 2,
        defaultSize * 2,
      ),
      child: Row(
        children: [
          Expanded(
            child: _BuildProductStyels(
              product: product,
              lable: 'Size',
            ),
          ),
          SizedBox(width: defaultSize),
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

  final Productmodels product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: defaultSize * 1.5,
        vertical: defaultSize * 1.5,
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
                    height: defaultSize * 2.5,
                    width: defaultSize * 2.5,
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

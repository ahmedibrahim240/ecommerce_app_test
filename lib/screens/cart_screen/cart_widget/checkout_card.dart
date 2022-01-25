import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: accountController.darkMode.value
            ? Colors.black54.withOpacity(.01)
            : Colors.white,
        child: Column(
          children: [
            _ChackOutRow(),
            if (authControllers.usermodels.value.cart.isNotEmpty)
              _RemoveAllButtom(),
          ],
        ),
      ),
    );
  }
}

class _RemoveAllButtom extends StatelessWidget {
  const _RemoveAllButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: defaultSize * 5.5,
      child: CustomButtom(
        bgColor: Colors.redAccent,
        margin: EdgeInsets.symmetric(vertical: 0),
        child: CustomText(
          text: "Remove All",
          color: Colors.white,
          alignment: Alignment.center,
        ),
        onPreessed: () {
          cartContllors.delateAllPrdect();
          bestSellingControllers.updataProduct(inCart: false, type: "all");
        },
      ),
    );
  }
}

class _ChackOutRow extends StatelessWidget {
  const _ChackOutRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: defaultSize, vertical: defaultSize),
      child: Obx(() {
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "TOTAL",
                    color: kGrayColor,
                    alignment: Alignment.centerLeft,
                    fontSize: 14,
                  ),
                  SizedBox(height: defaultSize / 2),
                  CustomText(
                    text: "\$ ${cartContllors.totalPrice.toStringAsFixed(2)}",
                    color: kPrimaryColor,
                    alignment: Alignment.centerLeft,
                    fontWeight: FontWeight.bold,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomButtom(
                bgColor: authControllers.usermodels.value.cart.isEmpty
                    ? Colors.redAccent
                    : kPrimaryColor,
                margin: EdgeInsets.symmetric(
                  vertical: defaultSize,
                  horizontal: defaultSize,
                ),
                child: CustomText(
                  text: authControllers.usermodels.value.cart.isEmpty
                      ? 'Shopping Now'
                      : "CHECKOUT",
                  color: Colors.white,
                  alignment: Alignment.center,
                ),
                onPreessed: () {
                  cartContllors.cartRoutePage();
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}

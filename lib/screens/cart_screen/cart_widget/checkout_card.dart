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
            if (cartContllors.cartItemList.isNotEmpty) _RemoveAllButtom(),
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
      height: 50,
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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  SizedBox(height: 5),
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
                bgColor: cartContllors.cartItemList.isEmpty
                    ? Colors.redAccent
                    : kPrimaryColor,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: CustomText(
                  text: cartContllors.cartItemList.isEmpty
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

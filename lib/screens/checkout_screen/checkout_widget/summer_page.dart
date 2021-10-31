import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:ecommerce_app/core/cutom_widget/custom_text.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/models/user_addrees_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummerPage extends StatelessWidget {
  const SummerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      AddressModel address = checkoutController.userAddress.value;
      return Column(
        children: [
          _productsReview(),
          productList(),
          SizedBox(height: 5),
          _totalPrice(),
          newDivider(),
          _userAddrees(address),
        ],
      );
    });
  }

  Row _totalPrice() {
    return Row(
      children: [
        CustomText(
          text: "TOTAL",
          color: kGrayColor,
          alignment: Alignment.centerLeft,
          fontSize: 14,
        ),
        SizedBox(height: 5),
        CustomText(
          text: ": ${cartContllors.totalPrice.toStringAsFixed(2)} \$",
          color: kPrimaryColor,
          alignment: Alignment.centerLeft,
          fontWeight: FontWeight.bold,
          fontSize: 13,
          maxLines: 1,
        ),
      ],
    );
  }

  Container productList() {
    return Container(
      height: 220,
      child: _BuildSummerItemList(),
    );
  }

  ListTile _userAddrees(AddressModel address) {
    String userAddress =
        '${address.country}-${address.state}-${address.city}-${address.street1}-${address.street2}';
    return ListTile(
      title: CustomText(
        text: 'Address',
        fontSize: 16,
        color: kPrimaryColor,
        fontWeight: FontWeight.bold,
      ),
      subtitle: CustomText(
        text: userAddress,
        maxLines: 3,
        fontSize: 12,
      ),
    );
  }

  Padding newDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Divider(
        color: kGrayColor,
        thickness: 1,
      ),
    );
  }

  Row _productsReview() {
    return Row(
      children: [
        Icon(
          Icons.search_rounded,
          color: kPrimaryColor,
          size: 20,
        ),
        SizedBox(width: 8),
        CustomText(
          text: 'Products back review',
          fontSize: 15,
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}

class _BuildSummerItemList extends StatelessWidget {
  const _BuildSummerItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cartContllors.cartItemList.length,
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        itemBuilder: (context, index) {
          CartProductMoldes product = cartContllors.cartItemList[index];
          return _ProductCard(
            index: index,
            product: product,
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 10),
      );
    });
  }
}

class _ProductCard extends GetWidget<AccountController> {
  const _ProductCard({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final CartProductMoldes product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        productImage(context),
        SizedBox(height: 8),
        CustomText(
          text: product.tilte ?? '',
          fontSize: 12,
          maxLines: 1,
        ),
        CustomText(
          text: "Quantity: ${product.quantity} ",
          fontSize: 12,
          color: kPrimaryColor,
        ),
        CustomText(
          text: "Price: ${product.price} \$",
          fontSize: 12,
          color: kPrimaryColor,
        ),
      ],
    );
  }

  Container productImage(BuildContext context) {
    return Container(
      width: 150,
      height: 140,
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
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
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

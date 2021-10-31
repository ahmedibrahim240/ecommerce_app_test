import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/constans/controllers.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/screens/product_screen/product_screen.dart';
import 'package:flutter/material.dart';

class BuildBestSellingItem extends StatelessWidget {
  final ProductModels product;
  final bool isAll;

  const BuildBestSellingItem({
    Key? key,
    required this.product,
    this.isAll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSized = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        routeController.routePage(
          type: 'to',
          page: ProductScreen(
            product: product,
          ),
        );
      },
      child: Container(
        width: (isAll) ? _screenSized.width : _screenSized.width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(_screenSized, context),
            _BuildDettails(
              isAll: isAll,
              product: product,
            )
          ],
        ),
      ),
    );
  }

  _buildImage(Size _screenSized, BuildContext context) {
    return Container(
      height: (isAll) ? 150 : 240,
      width: (isAll) ? _screenSized.width : null,
      padding: (isAll) ? const EdgeInsets.symmetric(horizontal: 5) : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Hero(
        tag: "image${product.image}",
        child: CustomCachedNetworkImage(
          context: context,
          url: product.image!,
          boxFit: (isAll) ? BoxFit.fill : BoxFit.cover,
          borderRadius: 5.0,
        ),
      ),
    );
  }
}

class _BuildDettails extends StatelessWidget {
  const _BuildDettails({
    Key? key,
    required this.isAll,
    required this.product,
  }) : super(key: key);

  final bool isAll;
  final ProductModels product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (isAll) ? const EdgeInsets.symmetric(horizontal: 10) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          CustomText(
            text: product.title ?? '',
            maxLines: 1,
            fontSize: 14,
            alignment: Alignment.centerLeft,
          ),
          const SizedBox(height: 10),
          CustomText(
            text: product.descraptions ?? '',
            maxLines: (isAll) ? 5 : 1,
            fontSize: 12,
            color: kGrayColor,
            alignment: Alignment.centerLeft,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "\$${product.price}",
                color: kPrimaryColor,
                alignment: Alignment.centerLeft,
              ),
              if (isAll)
                AddtoCartButtom(
                  product: product,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/screens/product_screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildProdectItem extends StatelessWidget {
  final Productmodels product;
  final bool isAll;
  const BuildProdectItem({
    Key? key,
    required this.product,
    this.isAll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routeController.routePage(
          type: 'to',
          page: ProductScreen(
            product: product,
          ),
        );
      },
      child: Obx(
        () => Container(
          width: (isAll) ? screenWidth : defaultSize * 20,
          child: (searchController.isSearch.value) &&
                  (searchController.searchList.isNotEmpty)
              ? ListTile(
                  leading: _buildImage(
                    context,
                    searchController.isSearch.value,
                  ),
                  title: CustomText(
                    text: product.title ?? '',
                    maxLines: 1,
                    fontSize: 14,
                    alignment: Alignment.centerLeft,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImage(
                      context,
                      false,
                    ),
                    _BuildDettails(
                      isAll: isAll,
                      product: product,
                    )
                  ],
                ),
        ),
      ),
    );
  }

  _buildImage(BuildContext context, bool isSearh) {
    return (isSearh) ? _iamgeAvatar(context) : _iamgeContainer(context);
  }

  _iamgeAvatar(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      child: SizedBox(
        height: defaultSize * 13,
        width: defaultSize * 13,
        child: ClipOval(
          child: CustomCachedNetworkImage(
            context: context,
            url: product.image,
            boxFit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  _iamgeContainer(BuildContext context) {
    return Container(
      height: (isAll) ? defaultSize * 15 : defaultSize * 24,
      width: (isAll) ? screenWidth : null,
      padding:
          (isAll) ? EdgeInsets.symmetric(horizontal: defaultSize / 2) : null,
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
  final Productmodels product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (isAll) ? EdgeInsets.symmetric(horizontal: defaultSize) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: defaultSize * 2),
          CustomText(
            text: product.title ?? '',
            maxLines: 1,
            fontSize: 14,
            alignment: Alignment.centerLeft,
          ),
          SizedBox(height: defaultSize),
          CustomText(
            text: product.descraptions ?? '',
            maxLines: (isAll) ? 5 : 1,
            fontSize: 12,
            color: kGrayColor,
            alignment: Alignment.centerLeft,
          ),
          SizedBox(height: defaultSize),
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

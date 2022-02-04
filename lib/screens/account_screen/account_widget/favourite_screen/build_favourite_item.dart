import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';

import '../../../screens.dart';

class BuildFavouriteItem extends StatelessWidget {
  const BuildFavouriteItem({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Productmodels product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        routeController.routePage(
          type: 'to',
          page: ProductScreen(
            product: product,
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buidlImage(context),
                SizedBox(
                  width: defaultSize,
                ),
                Expanded(
                  child: Container(
                    child: _buildDetales(),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    favoritesConttroller.removeFavoriteProdcut(
                      prodectID: product.productId!,
                    );
                    productControllers.updateIsForiteProduct(
                      isFavorite: false,
                      type: "id",
                      id: product.productId,
                    );
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: defaultSize * 5,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultSize * 8,
                vertical: defaultSize * 2,
              ),
              child: Divider(
                color: kGrayColor,
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Hero _buidlImage(BuildContext context) {
    return Hero(
      tag: "image${product.image}",
      child: CustomCachedNetworkImage(
        context: context,
        url: product.image,
        boxFit: BoxFit.fill,
        borderBottomLeftRadius: 10,
        borderTopLeftRadius: 10,
        isOnlyRadius: true,
        width: defaultSize * 15,
        height: defaultSize * 10,
      ),
    );
  }

  _buildDetales() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: product.title!,
          fontSize: 14,
          maxLines: 1,
          color: kPrimaryColor,
        ),
        CustomText(
          text: product.descraptions!,
          fontSize: 9,
          maxLines: 6,
          color: kGrayColor,
        ),
      ],
    );
  }
}

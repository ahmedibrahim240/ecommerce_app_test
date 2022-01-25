import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProductImageCard extends StatelessWidget {
  const ProductImageCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Productmodels product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    child: Hero(
                      tag: "image${product.image}",
                      child: CustomCachedNetworkImage(
                        context: context,
                        url: product.image,
                        boxFit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultSize),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.black,
                          ),
                          CircleButton(
                            onPressed: () {},
                            icon: FontAwesomeIcons.star,
                            iconSize: 22,
                            iconColor: Colors.yellow.shade900,
                            bgColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: defaultSize),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultSize),
            child: CustomText(
              text: product.title ?? '',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

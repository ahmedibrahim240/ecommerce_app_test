import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BestSellingSections extends StatelessWidget {
  const BestSellingSections({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return bestSellingControllers.productModels.isEmpty
            ? Container()
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Best Selling',
                        fontWeight: FontWeight.w700,
                      ),
                      TextButton(
                        onPressed: () => routeController.routePage(
                            type: 'to', page: AllProcutScreen()),
                        child: CustomText(
                          text: 'Seee all',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 350,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: bestSellingControllers.productModels.length,
                      itemBuilder: (_, index) {
                        return BuildBestSellingItem(
                          product: bestSellingControllers.productModels[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(width: 20),
                    ),
                  ),
                ],
              );
      },
    );
  }
}

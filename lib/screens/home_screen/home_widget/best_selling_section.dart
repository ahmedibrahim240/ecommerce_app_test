import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/best_selling_controllers%20.dart';
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
    return GetX(
      init: Get.put<BestSellingControllers>(BestSellingControllers()),
      builder: (BestSellingControllers bestControllers) {
        return bestControllers.productmodels.isEmpty
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
                          type: 'to',
                          page: AllProcutScreen(),
                        ),
                        child: CustomText(
                          text: 'Seee all',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: defaultSize * 2),
                  Container(
                    height: 350,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: bestControllers.productmodels.length,
                      itemBuilder: (_, index) {
                        return BuildProdectItem(
                          product: bestControllers.productmodels[index],
                        );
                      },
                      separatorBuilder: (
                        BuildContext context,
                        int index,
                      ) =>
                          SizedBox(
                        width: defaultSize * 2,
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}

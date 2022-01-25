import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/models/order_history_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../account_widget.dart';

class OrderHistoryListView extends StatelessWidget {
  const OrderHistoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return ListView.separated(
          shrinkWrap: true,
          itemCount: orderController.orderHistoryList.length,
          padding: EdgeInsets.symmetric(
            horizontal: defaultSize,
            vertical: defaultSize * 2,
          ),
          itemBuilder: (context, index) {
            int revIndex = orderController.orderHistoryList.length - 1 - index;

            OrderHistorymodels order =
                orderController.orderHistoryList[revIndex];
            return OrderCard(
              order: order,
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: defaultSize * 1.5,
          ),
        );
      },
    );
  }
}

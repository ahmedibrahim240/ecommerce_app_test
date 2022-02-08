import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/order_history_models.dart';

import 'package:ecommerce_app/screens/account_screen/account_widget/account_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryBody extends StatelessWidget {
  const OrderHistoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: Get.put<OrderController>(OrderController()),
      builder: (OrderController controller) {
        // return OrderHistoryListView();
        return (controller.getOrderList.isNotEmpty)
            ? ListView.separated(
                shrinkWrap: true,
                itemCount: controller.getOrderList.length,
                padding: EdgeInsets.symmetric(
                  horizontal: defaultSize,
                  vertical: defaultSize * 2,
                ),
                itemBuilder: (context, index) {
                  OrderHistorymodels order = controller.getOrderList[index];
                  return OrderCard(
                    order: order,
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: defaultSize * 1.5,
                ),
              )
            : EmptyData(
                icon: emptyorder,
                text: 'Not have order yet..',
              );
      },
    );
  }
}

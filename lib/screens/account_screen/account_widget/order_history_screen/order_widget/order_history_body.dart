import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/custom_text.dart';
import 'package:ecommerce_app/models/order_history_models.dart';
import 'package:ecommerce_app/screens/account_screen/account_widget/account_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryBody extends StatelessWidget {
  const OrderHistoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        // return OrderHistoryListView();
        return (orderController.orderHistoryList.isNotEmpty) &&
                (orderController.orderHistoryList != [])
            ? OrderHistoryListView()
            : EmptyOrder();
      },
    );
  }
}

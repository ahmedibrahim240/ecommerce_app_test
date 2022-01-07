import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/custom_text.dart';
import 'package:ecommerce_app/core/cutom_widget/custon_nav_bar.dart';
import 'package:ecommerce_app/models/order_history_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoading() {
  Get.defaultDialog(
    title: "Loading...",
    titleStyle: TextStyle(
      color: kPrimaryColor,
      fontSize: 14,
    ),
    content: CircularProgressIndicator(),
    barrierDismissible: false,
  );
}

dismissLoadingWidget() {
  Get.back();
}

showSuccessDialog(OrderHistoryModels order) {
  Get.defaultDialog(
    title: 'Success Payment',
    titleStyle: TextStyle(
      color: kPrimaryColor,
      fontSize: 14,
    ),
    content: CustomText(text: 'Complet Pyament'),
    barrierDismissible: false,
    actions: [
      TextButton(
        onPressed: () {
          orderController.createOders(order);
        },
        child: Text(
          'Submit',
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
      ),
    ],
  );
}

showFailedDialog() {
  Get.defaultDialog(
    title: "Failed Payment",
    titleStyle: TextStyle(
      color: kPrimaryColor,
      fontSize: 14,
    ),
    content: Text('Try again later..'),
    barrierDismissible: false,
    actions: [
      TextButton(
        onPressed: () {
          routeController.routePage(
            type: 'offAll',
            page: CustonNavBar(),
            arguments: 2.obs,
          );
        },
        child: Text(
          'Go Back',
          style: TextStyle(
            color: Colors.redAccent,
          ),
        ),
      ),
    ],
  );
}

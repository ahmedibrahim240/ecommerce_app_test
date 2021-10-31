import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/screens/checkout_screen/checkout_widget/checkout_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeLinePages extends StatelessWidget {
  const TimeLinePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getPage();
  }

  Widget getPage() {
    return Obx(() {
      switch (checkoutController.pageIndex.value) {
        case 1:
          return AddressPage();
        case 2:
          return SummerPage();
        default:
          return DeliveryPage();
      }
    });
  }
}

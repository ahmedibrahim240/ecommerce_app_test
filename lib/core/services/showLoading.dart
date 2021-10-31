import 'package:ecommerce_app/core/constans/constans.dart';
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

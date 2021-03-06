import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

customErrorSnakBar({required String error}) {
  Get.snackbar(
    'Error',
    error,
    snackPosition: SnackPosition.TOP,
    colorText: Colors.redAccent.shade700,
  );
}

customSnakBar({required String mass}) {
  Get.snackbar(
    'Done',
    mass,
    snackPosition: SnackPosition.TOP,
    colorText: kPrimaryColor,
  );
}

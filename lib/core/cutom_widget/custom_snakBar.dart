import 'package:flutter/material.dart';
import 'package:get/get.dart';

customErrorSnakBar({required String error}) {
  Get.snackbar(
    'Error',
    error,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.redAccent.shade700,
  );
}

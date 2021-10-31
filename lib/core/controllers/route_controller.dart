import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteController extends GetxController {
  static RouteController instance = Get.find();
  routePage({required String type, required dynamic page, dynamic arguments}) {
    switch (type) {
      case 'offAll':
        Get.offAll(
          page,
          transition: Transition.zoom,
          duration: Duration(milliseconds: 700),
          curve: Curves.easeInOut,
          arguments: arguments ?? null,
        );

        break;
      case 'to':
        Get.to(
          page,
          transition: Transition.zoom,
          duration: Duration(milliseconds: 700),
          curve: Curves.easeInOut,
          arguments: arguments ?? null,
        );
        break;
      default:
    }
  }
}

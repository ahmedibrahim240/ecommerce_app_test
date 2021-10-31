import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            checkoutController.pageIndex.value = 2;
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
    );
  }
}

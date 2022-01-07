import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          emptyorder,
          height: defaultSize * 23.2,
          width: defaultSize * 23.2,
        ),
        SizedBox(height: defaultSize),
        Center(
          child: CustomText(
            text: 'Not have Order yet..',
            alignment: Alignment.center,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

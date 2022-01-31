import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'custom_text.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({
    Key? key,
    required this.icon,
    this.text = 'Not have data...',
  }) : super(key: key);
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          icon,
          height: defaultSize * 23.2,
          width: defaultSize * 23.2,
        ),
        SizedBox(height: defaultSize),
        Center(
          child: CustomText(
            text: text,
            alignment: Alignment.center,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

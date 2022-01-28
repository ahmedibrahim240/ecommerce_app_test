import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'custom_text.dart';

class NODataYet extends StatelessWidget {
  const NODataYet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          emptyitemdata,
          height: defaultSize * 23.2,
          width: defaultSize * 23.2,
        ),
        Center(
          child: CustomText(
            text: 'Not have data...',
            alignment: Alignment.center,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

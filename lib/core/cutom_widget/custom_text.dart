import 'package:ecommerce_app/core/controllers/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? textHeight;
  final Alignment? alignment;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  const CustomText({
    Key? key,
    required this.text,
    this.color,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 18,
    this.maxLines,
    this.alignment = Alignment.centerLeft,
    this.textOverflow = TextOverflow.ellipsis,
    this.textAlign,
    this.textHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      builder: (controller) => Container(
        alignment: alignment,
        child: Text(
          text,
          overflow: textOverflow,
          maxLines: maxLines ?? null,
          textAlign: textAlign ?? null,
          style: TextStyle(
            color: (color == null)
                ? (controller.darkMode.value)
                    ? Colors.white
                    : Colors.black
                : color,
            height: textHeight ?? null,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}

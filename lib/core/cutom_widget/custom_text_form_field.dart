import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cutom_widget.dart';

class CustomTextFormField extends GetWidget<AccountController> {
  final String lable;
  final String hintText;
  final bool? obscureText;
  final bool? filled;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final String? initialValue;
  const CustomTextFormField({
    Key? key,
    required this.lable,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.filled = true,
    this.initialValue = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: lable,
          color:
              controller.darkMode.value ? Colors.white70 : Colors.grey.shade900,
          fontSize: 14,
        ),
        TextFormField(
          onSaved: onSaved,
          onChanged: onChanged,
          validator: validator,
          keyboardType: textInputType,
          obscureText: obscureText!,
          initialValue: initialValue,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: kGrayColor,
            ),
            fillColor:
                controller.darkMode.value ? Colors.black12 : Colors.white,
            filled: filled,
          ),
        ),
      ],
    );
  }
}

import 'package:ecommerce_app/core/controllers/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchTextForm extends GetWidget<AccountController> {
  const CustomSearchTextForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor:
            controller.darkMode.value ? Colors.black12 : Colors.grey.shade200,
        filled: true,
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: controller.darkMode.value ? Colors.white : Colors.black,
        ),
        focusedBorder: _customOutlineInputBorder(),
        enabledBorder: _customOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _customOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
    );
  }
}

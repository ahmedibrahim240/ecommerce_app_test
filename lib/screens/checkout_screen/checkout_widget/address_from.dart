import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressForm extends GetWidget<AddressController> {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: AddressForm.formKey,
      child: ListView(
        shrinkWrap: true,
        // ignore: invalid_use_of_protected_member
        primary: controller.adressList.value != [] ? false : true,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          CustomTextFormField(
            lable: 'Street 1',
            hintText: "21, Alex Davidson Avenue",
            filled: false,
            onSaved: (value) => controller.street1 = value,
            validator: (value) => value!.isEmpty ? "Street 1 Required" : null,
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            lable: 'Street 2',
            hintText: "Opposite Omegatron, Vicent Quarters",
            filled: false,
            onSaved: (value) => controller.street2 = value,
            validator: (value) => value!.isEmpty ? "Street 2 Required" : null,
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            lable: 'City',
            hintText: "Victoria Island",
            filled: false,
            onSaved: (value) => controller.city = value,
            validator: (value) => value!.isEmpty ? "City Required" : null,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  lable: 'State',
                  hintText: "Lagos State",
                  filled: false,
                  onSaved: (value) => controller.state = value,
                  validator: (value) =>
                      value!.isEmpty ? "State Required" : null,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: CustomTextFormField(
                  lable: 'Country',
                  hintText: "Nigeria",
                  filled: false,
                  onSaved: (value) => controller.country = value,
                  validator: (value) =>
                      value!.isEmpty ? "Country Required" : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressForm extends GetWidget<AddressController> {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Addressmodels? address;

  AddressForm({this.address});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: AddressForm.formKey,
      child: ListView(
        shrinkWrap: true,
        // ignore: invalid_use_of_protected_member
        primary: false,
        padding: EdgeInsets.symmetric(
          horizontal: defaultSize,
          vertical: defaultSize,
        ),
        children: [
          CustomTextFormField(
            lable: 'Street 1',
            hintText: "21, Alex Davidson Avenue",
            filled: false,
            initialValue: (address == null) ? '' : address?.street1,
            onSaved: (value) => controller.street1 = value,
            validator: (value) => value!.isEmpty ? "Street 1 Required" : null,
          ),
          SizedBox(height: defaultSize * 2.2),
          CustomTextFormField(
            lable: 'Street 2',
            hintText: "Opposite Omegatron, Vicent Quarters",
            filled: false,
            onSaved: (value) => controller.street2 = value,
            validator: (value) => value!.isEmpty ? "Street 2 Required" : null,
            initialValue: (address == null) ? '' : address?.street2,
          ),
          SizedBox(height: defaultSize * 2.2),
          CustomTextFormField(
            lable: 'City',
            hintText: "Victoria Island",
            filled: false,
            onSaved: (value) => controller.city = value,
            validator: (value) => value!.isEmpty ? "City Required" : null,
            initialValue: (address == null) ? '' : address?.city,
          ),
          SizedBox(height: defaultSize * 2.2),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  lable: 'State',
                  hintText: "Lagos State",
                  initialValue: (address == null) ? '' : address?.state,
                  filled: false,
                  onSaved: (value) => controller.state = value,
                  validator: (value) =>
                      value!.isEmpty ? "State Required" : null,
                ),
              ),
              SizedBox(width: defaultSize),
              Expanded(
                child: CustomTextFormField(
                  lable: 'Country',
                  hintText: "Nigeria",
                  initialValue: (address == null) ? '' : address?.country,
                  filled: false,
                  onSaved: (value) => controller.country = value,
                  validator: (value) =>
                      value!.isEmpty ? "Country Required" : null,
                ),
              ),
            ],
          ),
          SizedBox(height: defaultSize * 2.2),
          Obx(
            () => CustomButtom(
              child: CustomText(
                color: Colors.white,
                text: addressController.editAddress.value ? 'Edit' : 'Add',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                alignment: Alignment.center,
              ),
              bgColor: kPrimaryColor,
              onPreessed: () {
                validateAddrees();
              },
            ),
          ),
          SizedBox(height: defaultSize * 2.2),
        ],
      ),
    );
  }

  validateAddrees() async {
    if (AddressForm.formKey.currentState!.validate()) {
      AddressForm.formKey.currentState!.save();
      // controller.getAddressLength();

      Addressmodels address = new Addressmodels(
        street1: controller.street1,
        street2: controller.street2,
        city: controller.city,
        state: controller.state,
        country: controller.country,
        dateCreated: controller.editAddress.value
            ? controller.addressEditing.value.dateCreated
            : Timestamp.now(),
        isARLang: false,
        // id: controller.adreesLenght.value,
      );
      if (controller.editAddress.value) {
        await controller.updateAddress(address: address);
      } else {
        await controller.createNewaddress(address);
      }
    }
  }
}

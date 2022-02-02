import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/account_controller.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddressCard extends GetWidget<AccountController> {
  const AddressCard({
    Key? key,
    required this.address,
  }) : super(key: key);
  final Addressmodels address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: defaultSize,
        vertical: defaultSize,
      ),
      child: Container(
        height: defaultSize * 21,
        child: Card(
          elevation: 3,
          color: controller.darkMode.value ? Colors.black54 : Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AddressTextView(address: address),
              Divider(
                thickness: 1,
                color: kGrayColor,
              ),
              _AddressButtoms(address: address),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddressButtoms extends StatelessWidget {
  const _AddressButtoms({
    Key? key,
    required this.address,
  }) : super(key: key);

  final Addressmodels address;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: CustomButtom(
              onPreessed: () {
                addressController.editAddress.value = true;
                addressController.addressEditing.value = address;
              },
              bgColor: kPrimaryColor,
              child: CustomText(
                text: 'Edit',
                color: Colors.white,
                textAlign: TextAlign.center,
                alignment: Alignment.center,
              ),
            ),
          ),
          Expanded(
            child: CustomButtom(
              onPreessed: () async {
                await addressController.delateAddress(address);
              },
              bgColor: Colors.redAccent,
              child: CustomText(
                text: 'Delete',
                color: Colors.white,
                textAlign: TextAlign.center,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddressTextView extends StatelessWidget {
  const _AddressTextView({
    Key? key,
    required this.address,
  }) : super(key: key);

  final Addressmodels address;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultSize,
          vertical: defaultSize,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: authControllers.usermodels.value.name!,
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: kPrimaryColor,
            ),
            SizedBox(height: defaultSize / 2),
            Padding(
              padding: EdgeInsets.only(
                left: address.isARLang! ? 0 : 10,
                right: address.isARLang! ? 5 : 0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.addressCard,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                      SizedBox(width: defaultSize),
                      CustomText(
                        text: address.street1!,
                        textAlign: (address.isARLang!)
                            ? TextAlign.end
                            : TextAlign.start,
                        alignment: (address.isARLang!)
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  CustomText(
                    text: getCompleteAddress(address),
                    textAlign:
                        (address.isARLang!) ? TextAlign.end : TextAlign.start,
                    alignment: (address.isARLang!)
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    fontSize: 14,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

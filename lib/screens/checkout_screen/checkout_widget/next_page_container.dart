import 'package:ecommerce_app/core/constans/constans.dart';

import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NextPageContainer extends StatelessWidget {
  const NextPageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: Row(
          children: [
            Expanded(
              child: (checkoutController.pageIndex.value == 0)
                  ? Container()
                  : CustomButtom(
                      onPreessed: () {
                        checkoutController.backPage();
                      },
                      borderColor: kPrimaryColor,
                      borderWidth: 1.5,
                      child: CustomText(
                        text: "Back",
                        alignment: Alignment.center,
                      ),
                    ),
            ),
            Expanded(
              child: CustomButtom(
                onPreessed: () {
                  if (checkoutController.deliveryGroupValue.value == 0) {
                    customErrorSnakBar(
                      error: 'Choose Delivery State first',
                    );
                  } else if ((checkoutController.deliveryGroupValue.value ==
                          3) &&
                      (checkoutController.deliveryDate.value == '')) {
                    customErrorSnakBar(
                      error: 'Choose Delivery Date first',
                    );
                  } else if (checkoutController.pageIndex.value == 1) {
                    if (addressController.listOfAdress.isEmpty) {
                      customErrorSnakBar(
                        error: 'Create Address first',
                      );
                    } else {
                      if (addressController.addNewAddress.value) {
                        customErrorSnakBar(
                          error: 'Create Address first',
                        );
                      } else if (checkoutController.addressGroupValue.value ==
                          0) {
                        customErrorSnakBar(
                          error: 'Choose Address first',
                        );
                      } else {
                        checkoutController.nextPage();
                      }
                    }
                  } else {
                    checkoutController.nextPage();
                  }
                },
                bgColor: kPrimaryColor,
                child: CustomText(
                  text: "NEXT",
                  color: Colors.white,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // validateAddrees(AddressController controller) {
  //   if (AddressForm.formKey.currentState!.validate()) {
  //     AddressForm.formKey.currentState!.save();
  //     Addressmodels address = new Addressmodels(
  //       street1: addressController.street1,
  //       street2: addressController.street2,
  //       city: addressController.city,
  //       state: addressController.state,
  //       country: addressController.country,
  //       id: 0,
  //     );
  //     controller.createNewaddress(address);
  //   }
  // }
}

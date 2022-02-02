import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/address_controller.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/screens/account_screen/account_widget/address_screen/address.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddressBody extends StatelessWidget {
  const AddressBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        addressController.setInitControllerData();
        return true;
      },
      child: GetX(
        init: Get.put<AddressController>(AddressController()),
        builder: (AddressController controller) => Scaffold(
          appBar: AppBar(
            title: Text(
              controller.addNewAddress.value
                  ? 'Adding New Address'
                  : controller.editAddress.value
                      ? 'Edit Address'
                      : 'Address',
            ),
            actions: [
              controller.editAddress.value
                  ? TextButton.icon(
                      onPressed: () {
                        controller.editAddress.value = false;
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Colors.redAccent,
                        size: 20,
                      ),
                      label: CustomText(
                        text: 'Cancel',
                        fontSize: 12,
                        color: Colors.redAccent,
                      ),
                    )
                  : Container(),
            ],
          ),
          floatingActionButton: controller.editAddress.value
              ? null
              : FloatingActionButton(
                  onPressed: () {
                    controller.addNewAddress.value =
                        !controller.addNewAddress.value;
                  },
                  tooltip: 'Add Adress',
                  backgroundColor: kPrimaryColor,
                  child: Icon(
                    (controller.addNewAddress.value)
                        ? Icons.arrow_back_ios
                        : FontAwesomeIcons.locationArrow,
                    color: Colors.white,
                  ),
                ),
          body: (controller.addNewAddress.value)
              ? AddressForm()
              : controller.listOfAdress.isEmpty
                  ? EmptyData(
                      icon: emptyAddress,
                      text: 'No addresses found..',
                    )
                  : controller.editAddress.value
                      ? AddressForm(
                          address: controller.addressEditing.value,
                        )
                      : ListView.builder(
                          itemCount: controller.listOfAdress.length,
                          itemBuilder: (_, index) {
                            Addressmodels address =
                                controller.listOfAdress[index];

                            return AddressCard(
                              address: address,
                            );
                          },
                        ),
        ),
      ),
    );

    // EmptyData(
    //   icon: emptyAddress,
    //   text: 'No addresses found..',
    // );
  }
}

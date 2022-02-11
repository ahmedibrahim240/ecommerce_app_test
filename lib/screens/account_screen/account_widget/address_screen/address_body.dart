import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddressBody extends GetWidget<AccountController> {
  const AddressBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (addressController.editAddress.value) {
          addressController.editAddress.value = false;
          return false;
        } else {
          addressController.setInitControllerData();
          return true;
        }
      },
      child: GetX(
        init: Get.put<AddressController>(AddressController()),
        builder: (AddressController addressCont) => Scaffold(
          appBar: AppBar(
            title: Text(
              addressCont.addNewAddress.value
                  ? 'Adding New Address'
                  : addressCont.editAddress.value
                      ? 'Edit Address'
                      : 'Address',
            ),
            actions: [
              addressCont.editAddress.value
                  ? TextButton.icon(
                      onPressed: () {
                        addressCont.editAddress.value = false;
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
          floatingActionButton: addressCont.editAddress.value
              ? null
              : FloatingActionButton(
                  onPressed: () {
                    addressCont.addNewAddress.value =
                        !addressCont.addNewAddress.value;
                  },
                  tooltip: 'Add Adress',
                  backgroundColor: kPrimaryColor,
                  child: Icon(
                    (addressCont.addNewAddress.value)
                        ? Icons.location_disabled_rounded
                        : Icons.location_searching_rounded,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
          body: (addressCont.addNewAddress.value)
              ? AddressForm()
              : addressCont.listOfAdress.isEmpty
                  ? EmptyData(
                      icon: emptyAddress,
                      text: 'No addresses found..',
                    )
                  : addressCont.editAddress.value
                      ? AddressForm(
                          address: addressCont.addressEditing.value,
                        )
                      : ListView.builder(
                          itemCount: addressCont.listOfAdress.length,
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultSize,
                            vertical: defaultSize,
                          ),
                          itemBuilder: (_, index) {
                            Addressmodels address =
                                addressCont.listOfAdress[index];

                            return _addressCard(addressCont, address);
                          },
                        ),
        ),
      ),
    );
  }

  _addressCard(AddressController addressCont, Addressmodels address) {
    return Container(
      height: defaultSize * 21,
      child: Card(
        elevation: 3,
        color: controller.darkMode.value ? Colors.black54 : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultSize,
                  vertical: defaultSize,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _headerTitle(addressCont, address),
                    SizedBox(height: defaultSize / 2),
                    _addressTextView(address),
                    SizedBox(height: defaultSize / 2),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      activeColor: Colors.lightBlueAccent,
                      value: address.isShopping,
                      onChanged: (value) {
                        addressCont.updateAddress(
                          address: address,
                          isShopping: true,
                          value: value,
                        );
                      },
                      title: CustomText(
                        text: 'Use as the shipping address',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _headerTitle(AddressController addressCont, Addressmodels address) {
    return Row(
      children: [
        Expanded(
          child: CustomText(
            text: authControllers.usermodels.value.name!,
            textAlign: TextAlign.start,
            alignment: Alignment.centerLeft,
            color: kPrimaryColor,
          ),
        ),
        IconButton(
          onPressed: () {
            addressCont.editAddress.value = true;
            addressCont.addressEditing.value = address;
          },
          icon: Icon(
            Icons.edit_outlined,
            color: Colors.lightBlueAccent,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () async {
            await addressCont.delateAddress(address);
          },
          icon: Icon(
            Icons.delete_forever,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
      ],
    );
  }

  _addressTextView(Addressmodels address) {
    return Padding(
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
                textAlign:
                    (address.isARLang!) ? TextAlign.end : TextAlign.start,
                alignment: (address.isARLang!)
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                fontSize: 14,
              ),
            ],
          ),
          CustomText(
            text: getCompleteAddress(address),
            textAlign: (address.isARLang!) ? TextAlign.end : TextAlign.start,
            alignment: (address.isARLang!)
                ? Alignment.centerRight
                : Alignment.centerLeft,
            fontSize: 14,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

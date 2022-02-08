import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/user_addrees_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          primary: true,
          children: [
            _BillingAddressText(),
            (addressController.listOfAdress.isNotEmpty)
                ? ChooseEXAddress()
                : AddressForm(),
          ],
        ),
      );
    });
  }
}

class ChooseEXAddress extends StatelessWidget {
  const ChooseEXAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          TextButton.icon(
            icon: Icon(
              (addressController.shooseNewAddress.value)
                  ? Icons.arrow_circle_up
                  : Icons.arrow_circle_down,
              color: kPrimaryColor,
              size: 20,
            ),
            onPressed: () => addressController.funshooseNewAddress(),
            label: CustomText(
              text: 'Choose an address',
            ),
          ),
          if (addressController.shooseNewAddress.value) AddressListView(),
          TextButton.icon(
            icon: Icon(
              (addressController.addNewAddress.value)
                  ? Icons.arrow_circle_up
                  : Icons.arrow_circle_down,
              color: kPrimaryColor,
              size: 20,
            ),
            onPressed: () => addressController.funAddNewAddress(),
            label: CustomText(
              text: 'Add new address',
            ),
          ),
          if (addressController.addNewAddress.value) AddressForm(),
        ],
      ),
    );
  }
}

class _BillingAddressText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 4),
      minVerticalPadding: 0,
      leading: Container(
        height: 30,
        width: 30,
        child: DotIndicator(
          size: 35.0,
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
      title: CustomText(
        text: 'Billing address is the same as delivery address',
        fontSize: 12,
        maxLines: 2,
      ),
    );
  }
}

class AddressListView extends StatelessWidget {
  const AddressListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemCount: addressController.listOfAdress.length,
          itemBuilder: (context, index) {
            Addressmodels address = addressController.listOfAdress[index];
            return Obx(
              () => Theme(
                data: ThemeData(
                  unselectedWidgetColor: Colors.grey.shade400,
                ),
                child: RadioListTile(
                  value: index + 1,
                  groupValue: checkoutController.addressGroupValue.value,
                  isThreeLine: true,
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: kPrimaryColor,
                  dense: false,
                  title: CustomText(
                    text: 'Address ${index + 1}',
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: CustomText(
                    text: getFullAddress(address),
                    maxLines: 3,
                    fontSize: 12,
                  ),
                  onChanged: (value) {
                    Addressmodels newAddress =
                        addressController.listOfAdress[index];
                    checkoutController.updataAddressVale(value);
                    checkoutController.userAddress.value = newAddress;
                  },
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: defaultSize * 2.5),
        );
      },
    );
  }
}

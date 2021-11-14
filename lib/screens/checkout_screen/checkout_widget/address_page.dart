import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/custom_text.dart';
import 'package:ecommerce_app/models/user_addrees_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

import 'checkout_widget.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            _BillingAddressText(),
            // ignore: invalid_use_of_protected_member
            (addressController.adressList.value != [])
                ? Expanded(
                    child: ChooseEXAddress(),
                  )
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
        primary: true,
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
          itemCount: addressController.adressList.length,
          itemBuilder: (context, index) {
            int revIndex = addressController.adressList.length - 1 - index;
            AddressModel address = addressController.adressList[revIndex];
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
                    text:
                        '${address.country}-${address.state}-${address.city}-${address.street1}-${address.street2}',
                    maxLines: 3,
                    fontSize: 12,
                  ),
                  onChanged: (value) {
                    AddressModel newAddress =
                        addressController.adressList[revIndex];
                    checkoutController.updataAddressVale(value);
                    checkoutController.userAddress.value = newAddress;
                    print(checkoutController.userAddress.toJson());
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

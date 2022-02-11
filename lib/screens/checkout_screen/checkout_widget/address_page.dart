import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/user_addrees_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: Get.put<AddressController>(AddressController()),
      builder: (AddressController controller) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            shrinkWrap: true,
            primary: true,
            children: [
              billingAddressText(
                'Billing address is the same as delivery address',
              ),

              (controller.shippingAddress.value == '')
                  ? Container()
                  : Column(
                      children: [
                        SizedBox(height: defaultSize),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: kPrimaryColor,
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            CustomText(text: 'Shipping Address'),
                            SizedBox(width: defaultSize),
                          ],
                        ),
                        billingAddressText(
                          controller.shippingAddress.value,
                        ),
                        SizedBox(width: defaultSize),
                      ],
                    ),

              // CheckboxListTile(
              //   controlAffinity: ListTileControlAffinity.leading,
              //   contentPadding: EdgeInsets.zero,
              //   activeColor: Colors.lightBlueAccent,
              //   value: controller.shippingAddress!.isShopping,
              //   onChanged: (value) {},
              //   title: CustomText(
              //     text: 'Use as the shipping address',
              //     fontSize: 13,
              //   ),
              // ),

              (controller.listOfAdress.isNotEmpty)
                  ? ChooseEXAddress()
                  : AddressForm(),
            ],
          ),
        );
      },
    );
  }

  billingAddressText(String text) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 4),
      minVerticalPadding: 0,
      minLeadingWidth: 20,
      leading: Container(
        height: 25,
        width: 25,
        child: DotIndicator(
          size: 35.0,
          color: Colors.green,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 20,
            ).paddingZero,
          ),
        ),
      ),
      title: CustomText(
        text: text,
        fontSize: 12,
        maxLines: 2,
      ),
    );
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
          if (addressController.listOfAdress.length > 1)
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
                text: 'Choose Another Address',
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
                    addressController.updateAddress(
                      address: newAddress,
                      isShopping: true,
                      value: true,
                    );
                    checkoutController.updataAddressVale(value);
                    addressController.shooseNewAddress.value = false;
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

import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/custom_snakBar.dart';
import 'package:ecommerce_app/core/services/coustm_dialogs.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController instance = Get.find();
  String? street1, street2, city, state, country;
  var adressList = [].obs;
  var newAddress;
  RxBool addNewAddress = false.obs;
  RxBool shooseNewAddress = false.obs;
  String addressCollection = "users_address";
  List listOfAddress = [];
  var adreesLenght = 0.obs;
  AddressListmodels addressListmodels = AddressListmodels();
  @override
  void onReady() {
    super.onReady();
    if ((userToken != null) && (userToken != 'null')) getAllUserAdress();
    // ignore: invalid_use_of_protected_member
    if ((adressList.isNotEmpty) && (adressList.value != [])) {
      shooseNewAddress.value = true;
      addNewAddress.value = false;
    }
  }

  void funAddNewAddress() {
    addNewAddress.value = !addNewAddress.value;
    shooseNewAddress.value = false;
    update();
  }

  void funshooseNewAddress() {
    shooseNewAddress.value = !shooseNewAddress.value;
    addNewAddress.value = false;
    update();
  }

  createNewaddress(Addressmodels address) async {
    showLoading();
    String userId = authControllers.usermodels.value.id!;

    listOfAddress = [];
    newAddress = address.toJson();
    try {
      if (adressList.isEmpty) {
        listOfAddress.add(newAddress);
        addressListmodels = new AddressListmodels(
          addresses: listOfAddress,
        );
        await firebaseFirestore.collection(addressCollection).doc(userId).set(
              addressListmodels.toJson(),
            );
      } else {
        for (int i = 0; i < adressList.length; i++) {
          Addressmodels addressmodels = adressList[i];

          listOfAddress.add(addressmodels.toJson());
        }

        listOfAddress.add(newAddress);
        addressListmodels = new AddressListmodels(
          addresses: listOfAddress,
        );
        await firebaseFirestore
            .collection(addressCollection)
            .doc(userId)
            .update(
              addressListmodels.toJson(),
            );
      }
      getAllUserAdress();
      dismissLoadingWidget();
      addNewAddress.value = false;
      shooseNewAddress.value = true;
      checkoutController.addressGroupValue.value = 1;
      checkoutController.userAddress.value = address;
      customSnakBar(mass: 'Address Was Added..');
    } catch (e) {
      customErrorSnakBar(error: 'Failed please try again');

      dismissLoadingWidget();
    }

    update();
  }

  getAllUserAdress() async {
    AddressListmodels addressListmodels = AddressListmodels();
    adressList.value = [];
    var newList = [];

    await firebaseFirestore
        .collection(addressCollection)
        .doc(userToken)
        .get()
        .then(
      (value) {
        if (value.data() != null) {
          addressListmodels = AddressListmodels.fromJson(value);
          newList = addressListmodels.addresses!;
          for (int i = 0; i < newList.length; i++) {
            var address = newList[i];

            adressList.add(
              Addressmodels.fromJson(address),
            );
          }
        } else {
          return;
        }
      },
    );

    update();
  }

  getAddressLength() {
    adreesLenght.value = adressList.length;
  }
}

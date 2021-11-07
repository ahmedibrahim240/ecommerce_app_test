import 'package:ecommerce_app/core/constans/constans.dart';
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
  AddressListModels addressListModels = AddressListModels();
  @override
  void onReady() {
    super.onReady();
    getAllUserAdress();
    if (adressList.isNotEmpty) {
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

  createNewaddress(AddressModel address) async {
    String userId = authControllers.userModel.value.id!;
    await getAllUserAdress();
    listOfAddress = [];
    newAddress = address.toJson();
    if (adressList.isEmpty) {
      listOfAddress.add(newAddress);
      addressListModels = new AddressListModels(
        addresses: listOfAddress,
      );
      await firebaseFirestore.collection(addressCollection).doc(userId).set(
            addressListModels.toJson(),
          );
    } else {
      for (int i = 0; i < adressList.length; i++) {
        AddressModel addressModel = adressList[i];

        listOfAddress.add(addressModel.toJson());
      }
      listOfAddress.add(newAddress);
      addressListModels = new AddressListModels(
        addresses: listOfAddress,
      );
      await firebaseFirestore.collection(addressCollection).doc(userId).update(
            addressListModels.toJson(),
          );
      await getAllUserAdress();
      addressController.addNewAddress.value = false;
      addressController.shooseNewAddress.value = true;
      checkoutController.addressGroupValue.value = 1;
      checkoutController.userAddress.value = address;
    }

    update();
  }

  getAllUserAdress() async {
    String userId = await MySharedPreferences.getGetuserID() ?? 'null';
    // if (userId == 'null') {
    //   userId = authControllers.userModel.value.id!;
    // }
    AddressListModels addressListModels = AddressListModels();
    adressList.value = [];
    var newList = [];

    await firebaseFirestore
        .collection(addressCollection)
        .doc(userId)
        .get()
        .then(
      (value) {
        if (value.data() != null) {
          addressListModels = AddressListModels.fromJson(value);
          newList = addressListModels.addresses!;
          for (int i = 0; i < newList.length; i++) {
            var address = newList[i];

            adressList.add(
              AddressModel.fromJson(address),
            );
          }
        } else {
          adressList.value = [];
        }
      },
    );

    update();
  }
}

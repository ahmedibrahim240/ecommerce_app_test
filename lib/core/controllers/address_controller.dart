import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/custom_snakBar.dart';
import 'package:ecommerce_app/core/services/coustm_dialogs.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/models/user_addrees_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController instance = Get.find();
  Rx<List<Addressmodels>> addressList = Rx<List<Addressmodels>>([]);
  String? street1, street2, city, state, country;
  List<Addressmodels> get listOfAdress => addressList.value;
  RxBool addNewAddress = false.obs;
  RxBool editAddress = false.obs;
  RxBool shooseNewAddress = false.obs;
  String addressCollection = "address";
  Rx<Addressmodels> addressEditing = Addressmodels().obs;
  Rx<String> shippingAddress = ''.obs;
  // var adreesLenght = 0.obs;

  @override
  void onInit() {
    super.onInit();
    ever(authControllers.firebaseUser!, _setInitialStremData);
  }

  _setInitialStremData(User? user) {
    if (user == null) {
      debugPrint('wating user login in ');
    } else {
      addressList.bindStream(addressStreem(user.uid));
    }
  }

  setInitControllerData() {
    if (shippingAddress.value != '') {
      shooseNewAddress.value = false;
    } else {
      shooseNewAddress.value = true;
    }
    addNewAddress.value = false;
    editAddress.value = false;

    update();
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

    try {
      address.isARLang = await isARText(getCompleteAddress(address)) as bool;
      await firebaseFirestore
          .collection("users")
          .doc(userId)
          .collection(addressCollection)
          .add(
            address.toJson(),
          );

      addNewAddress.value = false;
      dismissLoadingWidget();
      if (listOfAdress.length == 1) {
        return;
      } else {
        for (int i = 1; i < listOfAdress.length; i++) {
          shippingAddress.value = getFullAddress(listOfAdress[0]);
          _updateIsShopping(false, userId, listOfAdress[i].id!);
        }
      }

      customSnakBar(mass: 'Address Was Added..');
    } catch (e) {
      addNewAddress.value = false;

      customErrorSnakBar(error: 'Failed please try again');

      dismissLoadingWidget();
    }

    update();
  }

  delateAddress(Addressmodels address) async {
    String userId = authControllers.usermodels.value.id!;
    try {
      if (address.isShopping == true) {
        shippingAddress.value = '';
      }
      await firebaseFirestore
          .collection("users")
          .doc(userId)
          .collection(addressCollection)
          .doc(address.id)
          .delete();
    } catch (e) {
      customErrorSnakBar(error: 'Failed please try again');
    }

    update();
  }

  updateAddress({
    bool isShopping = false,
    bool? value,
    required Addressmodels address,
  }) async {
    String userId = authControllers.usermodels.value.id!;

    try {
      address.isARLang = await isARText(getCompleteAddress(address)) as bool;
      if (isShopping) {
        listOfAdress.forEach(
          (item) async {
            if (item.id == address.id) {
              _updateIsShopping(value!, userId, address.id!);
            } else {
              if (item.isShopping) {
                _updateIsShopping(false, userId, item.id!);
              }
            }
          },
        );
        if (value == true) {
          shippingAddress.value = getFullAddress(address);
        } else {
          shippingAddress.value = '';
        }
      } else {
        showLoading();

        await firebaseFirestore
            .collection("users")
            .doc(userId)
            .collection(addressCollection)
            .doc(addressEditing.value.id)
            .update(
              address.toJson(),
            );
        editAddress.value = false;
        dismissLoadingWidget();
        customSnakBar(mass: 'Success Editing..');
      }
    } on FirebaseException catch (e) {
      dismissLoadingWidget();
      customErrorSnakBar(error: 'Failed please try again\n${e.message}');
    }

    update();
  }

  _updateIsShopping(
    bool value,
    String userId,
    String id,
  ) {
    firebaseFirestore
        .collection("users")
        .doc(userId)
        .collection(addressCollection)
        .doc(id)
        .update({Addressmodels.ISSHOPPING: value});
  }

  Stream<List<Addressmodels>> addressStreem(String uid) {
    return firebaseFirestore
        .collection("users")
        .doc(uid)
        .collection(addressCollection)
        .orderBy(Addressmodels.DATECREATED, descending: true)
        .snapshots()
        .map(
      (QuerySnapshot query) {
        List<Addressmodels> retVal = [];
        query.docs.forEach(
          (address) {
            retVal.add(Addressmodels.fromJson(address));
          },
        );
        retVal.forEach(
          (item) {
            if (item.isShopping) {
              shippingAddress.value = getFullAddress(item);
            }
          },
        );
        setInitControllerData();
        return retVal;
      },
    );
  }
}

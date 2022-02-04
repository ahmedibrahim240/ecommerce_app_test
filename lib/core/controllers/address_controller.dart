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
  // var adreesLenght = 0.obs;

  @override
  void onInit() {
    super.onInit();

    setInitControllerData();

    ever(authControllers.firebaseUser!, _setInitialStremData);
  }

  void onReady() {
    super.onReady();
    setInitControllerData();
  }

  _setInitialStremData(User? user) {
    if (user == null) {
      debugPrint('wating user login in ');
    } else {
      addressList.bindStream(addressStreem(user.uid));
      if ((listOfAdress.isNotEmpty) && (listOfAdress != [])) {
        shooseNewAddress.value = true;
        addNewAddress.value = false;
      }
    }
  }

  setInitControllerData() {
    if ((listOfAdress.isNotEmpty) && (listOfAdress != [])) {
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

  updateAddress(Addressmodels address) async {
    String userId = authControllers.usermodels.value.id!;
    print('Userid:$userId\naddressid:${addressEditing.value.id}');
    print(address.toJson());
    try {
      address.isARLang = await isARText(getCompleteAddress(address)) as bool;
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
    } on FirebaseException catch (e) {
      dismissLoadingWidget();
      debugPrint(e.message);
      customErrorSnakBar(error: 'Failed please try again');
    }

    update();
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
        return retVal;
      },
    );
  }

  // getAddressLength() {
  //   adreesLenght.value = listOfAdress.length;
  // }
}

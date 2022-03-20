import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';

import 'package:ecommerce_app/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartContllors extends GetxController {
  static CartContllors instance = Get.find();
  Rx<List<CartFireBaseModel>> cartFireBase = Rx<List<CartFireBaseModel>>([]);
  Rx<List<CartItemmodels>> cartProductList = Rx<List<CartItemmodels>>([]);
  List<CartItemmodels> get cartItemList => cartProductList.value;
  List<CartFireBaseModel> get cartfireBaseList => cartFireBase.value;

  var totalPrice = 0.0.obs;

  String cartCollection = "cart";

  Rx<bool> reloadPage = false.obs;
  @override
  void onReady() {
    super.onReady();

    ever(authControllers.firebaseUser!, _setFavoriteDate);
    ever(cartFireBase, getCartItemListDate);
  }

  _setFavoriteDate(User? user) {
    if (user == null) {
      debugPrint('wating user login in ');
    } else {
      cartFireBase.bindStream(cartStream(user.uid));
    }
  }

  Stream<List<CartFireBaseModel>> cartStream(String uid) {
    return firebaseFirestore
        .collection("users")
        .doc(uid)
        .collection(cartCollection)
        .orderBy(Addressmodels.DATECREATED, descending: true)
        .snapshots()
        .map(
      (QuerySnapshot query) {
        List<CartFireBaseModel> retVal = [];
        query.docs.forEach(
          (favourite) {
            CartFireBaseModel newCartItem =
                CartFireBaseModel.fromJson(favourite);

            retVal.add(newCartItem);
          },
        );
        return retVal;
      },
    );
  }

  getCartItemListDate(List<CartFireBaseModel> cartList) {
    if (cartList.isEmpty) {
      cartProductList.value = [];
      productControllers.updataInCartProduct(
        inCart: false,
        type: 'all',
      );
    } else {
      cartProductList.value = [];
      cartList.forEach(
        (item) {
          _addItemTolist(item);
        },
      );
    }
    _getTotalPrice();

    update();
  }

  _addItemTolist(CartFireBaseModel item) {
    if (!allProductController.chechIsProductIsExisting(item.productId!)) {
      debugPrint('Product wass delate');
      delateCartProduct(item.productId!);
    } else {
      debugPrint('Product wass add');
      Productmodels prodcut =
          allProductController.getProductByid(item.productId!);
      CartItemmodels cartItem = new CartItemmodels(
        price: prodcut.price,
        quantity: item.quantity!,
        title: prodcut.title,
        image: prodcut.image,
        id: item.id,
        productId: prodcut.productId,
      );
      productControllers.updataInCartProduct(
        inCart: true,
        type: 'id',
        id: item.productId!,
      );
      cartProductList.value.add(cartItem);
    }
    update();
  }

  addCartProduct(CartFireBaseModel product) async {
    try {
      String userId = authControllers.usermodels.value.id!;

      await firebaseFirestore
          .collection("users")
          .doc(userId)
          .collection(cartCollection)
          .add(
            product.toJson(),
          );
    } on FirebaseException catch (e) {
      print(e.message);
      customErrorSnakBar(
        error: "Cannot add this item , try again later\n${e.message}",
      );
    }
    update();
  }

  delateCartProduct(String? prodectID) async {
    try {
      String userId = authControllers.usermodels.value.id!;
      String cartId = getCartItemById(prodectID!).id!;

      await firebaseFirestore
          .collection("users")
          .doc(userId)
          .collection(cartCollection)
          .doc(cartId)
          .delete();
      productControllers.updataInCartProduct(
        inCart: false,
        type: "id",
        id: prodectID,
      );
    } on FirebaseException catch (e) {
      print(e.message);
      customErrorSnakBar(
        error: "Cannot remove this item , try again later\n${e.message}",
      );
    }
    update();
  }

  delateAllPrdect() async {
    try {
      String userId = authControllers.usermodels.value.id!;

      await firebaseFirestore
          .collection("users")
          .doc(userId)
          .collection(cartCollection)
          .get()
          .then(
        (snapshot) {
          for (DocumentSnapshot ds in snapshot.docs) {
            ds.reference.delete();
          }
        },
      );
    } on FirebaseException catch (e) {
      customErrorSnakBar(
        error: "Can't clear data , try again later\n$e",
      );
    }
    update();
  }

  _getTotalPrice() {
    if (cartItemList.isEmpty) {
      totalPrice.value = 0.0;
    } else {
      totalPrice.value = 0.0;

      cartItemList.forEach(
        (element) {
          totalPrice.value += (element.price! * element.quantity);
        },
      );
    }
  }

  decreaseQuantity(CartItemmodels cartItem) async {
    try {
      cartItem.quantity--;
      String userId = authControllers.usermodels.value.id!;

      await firebaseFirestore
          .collection("users")
          .doc(userId)
          .collection(cartCollection)
          .doc(cartItem.id)
          .update(
        {
          CartFireBaseModel.QUANTITIY: cartItem.quantity,
        },
      );
    } on FirebaseException catch (e) {
      print(e.message);
      customErrorSnakBar(
        error: "Cannot decrease this item , try again later\n${e.message}",
      );
    }

    update();
  }

  increaseQuntitiy(CartItemmodels cartItem) async {
    try {
      String userId = authControllers.usermodels.value.id!;
      cartItem.quantity++;
      await firebaseFirestore
          .collection("users")
          .doc(userId)
          .collection(cartCollection)
          .doc(cartItem.id)
          .update(
        {
          CartFireBaseModel.QUANTITIY: cartItem.quantity,
        },
      );
    } on FirebaseException catch (e) {
      print(e.message);
      customErrorSnakBar(
        error: "Cannot increase this item , try again later\n${e.message}",
      );
    }
    update();
  }

  CartFireBaseModel getCartItemById(String id) {
    return cartfireBaseList.where((item) => (item.productId == id)).last;
  }

  cartRoutePage() async {
    if (cartItemList.isEmpty) {
      routeController.routePage(
        type: 'offAll',
        page: () => CustonNavBar(),
        arguments: 0.obs,
      );
    } else {
      routeController.routePage(
        type: 'to',
        page: () => CheckOutScreen(),
      );
    }
  }
}

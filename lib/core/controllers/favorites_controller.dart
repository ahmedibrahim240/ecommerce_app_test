import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/core/constans/constans.dart';

import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';

class FavoritesConttroller extends GetxController {
  static FavoritesConttroller instance = Get.find();
  Rx<List<FavouriteModels>> favouriteList = Rx<List<FavouriteModels>>([]);
  Rx<List<Productmodels>> favouriteProductList = Rx<List<Productmodels>>([]);
  List<Productmodels> get favouriteItemsList => favouriteProductList.value;
  List<FavouriteModels> get getfavouriteList => favouriteList.value;
  String favouriteCollection = "favourite";

  @override
  void onInit() {
    super.onInit();
    ever(authControllers.firebaseUser!, _setFavoriteDate);
    ever(favouriteList, getAllFavoriteItmesDate);
  }

  _setFavoriteDate(User? user) {
    if (user == null) {
      debugPrint('wating user login in ');
    } else {
      favouriteList.bindStream(favoriteStream(user.uid));
    }
  }

  Stream<List<FavouriteModels>> favoriteStream(String uid) {
    return firebaseFirestore
        .collection("users")
        .doc(uid)
        .collection(favouriteCollection)
        .orderBy(Addressmodels.DATECREATED, descending: true)
        .snapshots()
        .map(
      (QuerySnapshot query) {
        List<FavouriteModels> retVal = [];
        query.docs.forEach(
          (favourite) {
            FavouriteModels newFav = FavouriteModels.fromJson(favourite);

            retVal.add(newFav);
          },
        );
        return retVal;
      },
    );
  }

  getAllFavoriteItmesDate(List<FavouriteModels> favList) {
    if (favList.isEmpty) {
      favouriteProductList.value = [];
      productControllers.updateIsForiteProduct(
        isFavorite: false,
        type: 'all',
      );
    } else {
      favouriteProductList.value = [];
      favList.forEach(
        (fav) {
          _addItemTolist(fav.productId!);
        },
      );
    }
    update();
  }

  _addItemTolist(String id) {
    if (!allProductController.chechIsProductIsExisting(id)) {
      debugPrint('Product wass delate');
      removeFavoriteProdcut(id);
    } else {
      debugPrint('Product wass add');

      productControllers.updateIsForiteProduct(
        isFavorite: true,
        type: 'id',
        id: id,
      );

      favouriteProductList.value.add(
        allProductController.getProductByid(id),
      );
    }
    update();
  }

  addFavoriteProdcut(FavouriteModels favourite) async {
    try {
      String userId = authControllers.usermodels.value.id!;

      await firebaseFirestore
          .collection("users")
          .doc(userId)
          .collection(favouriteCollection)
          .add(
            favourite.toJson(),
          );
    } on FirebaseException catch (e) {
      print(e.message);
      customErrorSnakBar(
        error: "Cannot add this item , try again later\n${e.message}",
      );
    }
    update();
  }

  removeFavoriteProdcut(String? prodectID) async {
    try {
      String userId = authControllers.usermodels.value.id!;
      String favId = getFavoriteItemByProductID(prodectID!).id!;

      await firebaseFirestore
          .collection("users")
          .doc(userId)
          .collection(favouriteCollection)
          .doc(favId)
          .delete();
      productControllers.updateIsForiteProduct(
        isFavorite: false,
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

  clearFavoriteProdcut() async {
    try {
      String userId = authControllers.usermodels.value.id!;

      await firebaseFirestore
          .collection("users")
          .doc(userId)
          .collection(favouriteCollection)
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

  FavouriteModels getFavoriteItemByProductID(String id) {
    return getfavouriteList.where((fav) => fav.productId == id).last;
  }

  checkupDateProductInbestSelling(List<Productmodels> proList) {
    getAllFavoriteItmesDate(getfavouriteList);
  }
}

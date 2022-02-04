import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BestSellingControllers extends GetxController {
  static BestSellingControllers instance = Get.find();
  Rx<List<Productmodels>> productList = Rx<List<Productmodels>>([]);
  List<Productmodels> get productmodels => productList.value;
  final CollectionReference _collectionReference =
      firebaseFirestore.collection("BestSellingProdect");
  void onInit() {
    super.onInit();
    ever(authControllers.firebaseUser!, _setBestProductData);
  }

  _setBestProductData(User? user) {
    if (user == null) {
      debugPrint('wating user login in ');
    } else {
      productList.bindStream(bestProductStream(user.uid));
    }

    update();
  }

  Stream<List<Productmodels>> bestProductStream(String uid) {
    return _collectionReference.snapshots().map(
      (query) {
        List<Productmodels> retVal = [];
        query.docs.forEach(
          (product) {
            Productmodels newProduct = Productmodels.fromJson(
              product,
            );
            // newProduct.inCart = cartContllors.isINCartInitial(
            //   newProduct,
            // );
            // newProduct.isFavorite = productControllers.isFavoriteProduct(
            //   newProduct,
            // ) ;
            retVal.add(
              newProduct,
            );
            allProductController.productList.value.add(newProduct);
          },
        );

        return retVal;
      },
    );
  }

  Productmodels getBestProductById(String id) {
    return productmodels.where((product) => (product.productId == id)).last;
  }

  bool chcekIsBestProduct(String id) {
    return productmodels
        .where((product) => (product.productId == id))
        .isNotEmpty;
  }
}

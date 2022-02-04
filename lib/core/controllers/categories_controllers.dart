import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesControllers extends GetxController {
  static CategoriesControllers instance = Get.find();
  Rx<List<Categoriesmodels>> categoryList = Rx<List<Categoriesmodels>>([]);

  List<Categoriesmodels> get categoriesmodels => categoryList.value;
  final CollectionReference _collectionReference =
      firebaseFirestore.collection("Categories");
  void onInit() {
    super.onInit();
    ever(authControllers.firebaseUser!, _setCategoryData);
  }

  _setCategoryData(User? user) {
    if (user == null) {
      debugPrint('wating user login in ');
    } else {
      categoryList.bindStream(categoryStream());
    }
  }

  Stream<List<Categoriesmodels>> categoryStream() {
    // print('____________________');
    // print('STRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRREEEEEEEEEEEMING');
    return _collectionReference.snapshots().map(
      (query) {
        List<Categoriesmodels> retVal = [];
        query.docs.forEach(
          (category) {
            // Productmodels newProduct = Productmodels.fromJson(
            //   product,
            // );
            // newProduct.inCart = cartContllors.isINCartInitial(
            //   newProduct,
            // );
            // newProduct.isFavorite = productControllers.isFavoriteProduct(
            //   newProduct,
            // ) ;
            // print(Categoriesmodels.fromJson(category.data()));
            retVal.add(
              Categoriesmodels.fromJson(category.data()),
            );
          },
        );

        return retVal;
      },
    );
  }

  Categoriesmodels getCategoryById(String id) {
    return categoriesmodels.where((item) => item.id == id).last;
  }
}

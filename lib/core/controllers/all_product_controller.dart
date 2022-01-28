import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

class AllProductController extends GetxController {
  static AllProductController instance = Get.find();
  var allProductList = [];
  // @override
  // void onReady() {
  //   super.onReady();
  //   if ((bestSellingControllers.productmodels.isNotEmpty) &&
  //       (categoriesControllers.categoriesmodels.isNotEmpty)) getAllPrductList();
  // }

  getAllPrductList() {
    allProductList.clear();
    bestSellingControllers.productmodels.forEach(
      (product) {
        allProductList.add(product);
      },
    );
    categoriesControllers.categoriesmodels.forEach(
      (category) {
        if (category.productList.isNotEmpty) {
          category.productList.forEach(
            (product) {
              allProductList.add(product);
            },
          );
        }
      },
    );

    // if (allProductList.isEmpty) {
    //   return;
    // } else {
    //   allProductList.forEach(
    //     (product) async {
    //       await addAllPRoductToFireBase(product);
    //     },
    //   );
    // }
  }

  addAllPRoductToFireBase(Productmodels product) async {
    try {
      await firebaseFirestore
          .collection(ALLPRODUCTCOlLECTION)
          .doc(product.productId)
          .set(
            product.toJson(),
          );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

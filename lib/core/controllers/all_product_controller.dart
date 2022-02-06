import 'dart:async';

import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/models/models.dart';

import 'package:get/get.dart';

class AllProductController extends GetxController {
  static AllProductController instance = Get.find();
  Rx<List<Productmodels>> productList = Rx<List<Productmodels>>([]);
  // ignore: close_sinks
  StreamController<List<Productmodels>> productStreamCont = StreamController();
  List<Productmodels> get allProductList => productList.value;
  void onReady() {
    super.onReady();

    ever(
      bestSellingControllers.productList,
      checkUpdateBestProductList,
    );
    ever(
      categoriesControllers.categoryList,
      checkUpdatecateoryProductList,
    );
  }

  bool chechIsProductIsExisting(String id) {
    return allProductList
        .where((product) => (product.productId == id))
        .isNotEmpty;
  }

  Productmodels getProductByid(String id) {
    return allProductList.where((product) => (product.productId == id)).last;
  }

  checkUpdateBestProductList(List<Productmodels> listProduct) {
    List<Productmodels> newProductList = [];
    listProduct.forEach(
      (newProdect) {
        newProductList.add(newProdect);
      },
    );
    categoriesControllers.categoryList.value.forEach(
      (category) {
        if (category.productList != null) {
          category.productList!.forEach(
            (product) {
              newProductList.add(product);
            },
          );
        }
      },
    );
    productList.value = newProductList;
    cartContllors.getCartItemListDate(
      cartContllors.cartfireBaseList,
    );
    favoritesConttroller.getAllFavoriteItmesDate(
      favoritesConttroller.getfavouriteList,
    );
    update();
  }

  checkUpdatecateoryProductList(List<Categoriesmodels> newCategoy) {
    List<Productmodels> newProductList = [];
    newCategoy.forEach(
      (category) {
        if (category.productList != null) {
          category.productList!.forEach(
            (product) {
              newProductList.add(product);
            },
          );
        }
      },
    );
    bestSellingControllers.productList.value.forEach(
      (product) {
        newProductList.add(product);
      },
    );
    productList.value = newProductList;

    cartContllors.getCartItemListDate(
      cartContllors.cartfireBaseList,
    );
    favoritesConttroller.getAllFavoriteItmesDate(
      favoritesConttroller.getfavouriteList,
    );
    update();
  }
}

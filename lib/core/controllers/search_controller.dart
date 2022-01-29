import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SearchController extends GetxController {
  static SearchController instance = Get.find();
  Rx<bool> isSearch = false.obs;
  Rx<bool> isHomeBody = true.obs;
  Rx<bool> isNoData = false.obs;
  TextEditingController searshText = TextEditingController();
  var searchList = [].obs;
  searchState() {
    isSearch.value = !isSearch.value;
    searchList.clear();

    isHomeBody.value = true;
    isNoData.value = false;
    update();
  }

  isHomeBodyFun(String text) {
    if (text.isEmpty) {
      searchList.clear();
      isHomeBody.value = true;
    } else {
      if (searchList.isEmpty) {
        isHomeBody.value = false;

        isNoData.value = true;
      } else {
        isHomeBody.value = false;

        isNoData.value = false;
      }
    }

    update();
  }

  searchByName(String? text) {
    searchList.clear();
    if (text == null) {
      searchList.clear();
      return;
    } else if (text.isEmpty) {
      searchList.clear();
    } else {
      allProductController.allProductList.forEach(
        (product) {
          if (product.title.toString().toLowerCase().contains(
                text.toLowerCase(),
              )) {
            searchList.add(product);
          } else {
            searchInByCategory(text);
          }
        },
      );
    }
    isHomeBodyFun(text);
  }

  searchInByCategory(String text) {
    categoriesControllers.categoriesmodels.forEach(
      (category) {
        if (category.name.toString().toLowerCase().contains(
              text.toLowerCase(),
            )) {
          if (category.productList != []) {
            searchList.clear();
            category.productList.forEach((product) {
              searchList.add(product);
            });
          }
        }
      },
    );
    update();
  }
}

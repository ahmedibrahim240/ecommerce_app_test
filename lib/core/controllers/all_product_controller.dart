import 'package:ecommerce_app/core/constans/constans.dart';

import 'package:get/get.dart';

class AllProductController extends GetxController {
  static AllProductController instance = Get.find();
  var allProductList = [];

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
  }

  bool chechIsProductIsExisting(String id) {
    return allProductList
        .where((product) => (product.productId == id))
        .isNotEmpty;
  }
}

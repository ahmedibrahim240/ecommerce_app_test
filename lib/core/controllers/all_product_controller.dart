import 'package:ecommerce_app/models/models.dart';

import 'package:get/get.dart';

class AllProductController extends GetxController {
  static AllProductController instance = Get.find();
  Rx<List<Productmodels>> productList = Rx<List<Productmodels>>([]);
  List<Productmodels> get allProductList => productList.value;

  bool chechIsProductIsExisting(String id) {
    return allProductList
        .where((product) => (product.productId == id))
        .isNotEmpty;
  }

  Productmodels getProductByid(String id) {
    return allProductList.where((product) => (product.productId == id)).last;
  }
}

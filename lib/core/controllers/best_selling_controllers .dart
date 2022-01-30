import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:get/get.dart';

class BestSellingControllers extends GetxController {
  static BestSellingControllers instance = Get.find();
  var productmodels = [].obs;
  final CollectionReference _collectionReference =
      firebaseFirestore.collection("BestSellingProdect");
  getBestProduct() async {
    productmodels.value = [];
    await _collectionReference.get().then(
      (value) async {
        for (int i = 0; i < value.docs.length; i++) {
          Productmodels product = Productmodels.fromJson(
            value.docs[i].data(),
          );
          product.inCart = cartContllors.isINCartInitial(
            product,
          );
          product.isFavorite = productControllers.isFavoriteProduct(
            product,
          );
          productmodels.add(
            product,
          );
        }
      },
    );
    update();
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

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
          productmodels.add(
            product,
          );
        }
      },
    );
    update();
  }

  updataProduct({required var inCart, String? id, required String type}) {
    switch (type) {
      case 'id':
        // late Productmodels product;

        for (int i = 0; i < productmodels.length; i++) {
          if (productmodels[i].id == id) {
            productmodels[i].inCart = inCart;
          }
        }
        // product.inCart = inCart;

        break;
      case 'all':
        for (int i = 0; i < productmodels.length; i++) {
          productmodels[i].inCart = inCart;
        }

        break;
    }

    update();
  }

  Productmodels getBestProductById(String id) {
    return productmodels.where((product) => (product.id == id)).last;
  }

  // @override
  // void onReady() async {
  //   super.onReady();
  //   // if (cartContllors.cartItemList.isEmpty)
  //   //   await updataProduct(inCart: false, type: 'all');
  //   getBestProduct();
  // }
}

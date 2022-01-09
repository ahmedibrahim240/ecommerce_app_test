import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:get/get.dart';

class BestSellingControllers extends GetxController {
  static BestSellingControllers instance = Get.find();
  var productModels = [].obs;
  final CollectionReference _collectionReference =
      firebaseFirestore.collection("BestSellingProdect");
  getBestProduct() async {
    productModels.value = [];
    await _collectionReference.get().then(
      (value) async {
        for (int i = 0; i < value.docs.length; i++) {
          ProductModels product = ProductModels.fromJson(
            value.docs[i].data(),
          );
          product.inCart = await cartContllors.isINCartInitial(
            product.id,
          );
          productModels.add(
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
        late ProductModels product;

        for (int i = 0; i < productModels.length; i++) {
          if (productModels[i].id == id) {
            product = productModels[i];
          }
        }
        product.inCart = inCart;

        break;
      case 'all':
        for (int i = 0; i < productModels.length; i++) {
          productModels[i].inCart = inCart;
        }

        break;
    }

    update();
  }

  @override
  void onReady() async {
    super.onReady();
    if (cartContllors.cartItemList.isEmpty)
      await updataProduct(inCart: false, type: 'all');
    getBestProduct();
  }
}

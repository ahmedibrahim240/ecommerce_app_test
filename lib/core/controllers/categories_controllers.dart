import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:get/get.dart';

class CategoriesControllers extends GetxController {
  static CategoriesControllers instance = Get.find();
  var categoriesModels = [].obs;
  final CollectionReference _collectionReference =
      firebaseFirestore.collection("Categories");
  getCategory() async {
    categoriesModels.value = [];
    await _collectionReference.get().then(
      (value) {
        for (int i = 0; i < value.docs.length; i++) {
          categoriesModels.add(
            CategoriesModels.fromJson(
              value.docs[i].data(),
            ),
          );
        }
      },
    );
    update();
  }

  @override
  void onReady() {
    super.onReady();
    getCategory();
  }
}

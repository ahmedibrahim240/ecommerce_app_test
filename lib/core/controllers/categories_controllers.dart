import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:get/get.dart';

class CategoriesControllers extends GetxController {
  static CategoriesControllers instance = Get.find();
  var categoriesmodels = [].obs;
  final CollectionReference _collectionReference =
      firebaseFirestore.collection("Categories");
  getCategory() async {
    categoriesmodels.value = [];
    await _collectionReference.get().then(
      (value) {
        for (int i = 0; i < value.docs.length; i++) {
          categoriesmodels.add(
            Categoriesmodels.fromJson(
              value.docs[i].data(),
            ),
          );
        }
      },
    );
    update();
  }

  Categoriesmodels getCategoryById(String id) {
    return categoriesmodels.where((item) => item.id == id).last;
  }
}

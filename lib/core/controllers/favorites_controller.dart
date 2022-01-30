import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/core/constans/constans.dart';

import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';

class FavoritesConttroller extends GetxController {
  static FavoritesConttroller instance = Get.find();
  var favorieitemsList = [].obs;
  void onReady() {
    super.onReady();
    if (allProductController.allProductList.isNotEmpty)
      ever(authControllers.usermodels, getAllFavorieitems);
    // ignore: invalid_use_of_protected_member
  }

  getAllFavorieitems(Usermodels user) {
    if (user.favoriteList!.isEmpty) {
      favorieitemsList.clear();
    } else {
      user.favoriteList!.forEach(
        (id) {
          if (allProductController.chechIsProductIsExisting(id)) {
            addItemTolist(id.toString());
          } else {
            removeFavoriteProdcut(id.toString());
          }
        },
      );
    }
  }

  addItemTolist(String id) {
    favorieitemsList.clear();

    allProductController.allProductList.forEach(
      (product) {
        if (product.productId == id) {
          favorieitemsList.add(product);
        }
      },
    );
  }

  addFavoriteProdcut(String prodectID) async {
    try {
      await authControllers.updateUserData(
        {
          Usermodels.FAVORITElIST: FieldValue.arrayUnion(
            [
              prodectID,
            ],
          ),
        },
      );
    } catch (e) {
      customErrorSnakBar(
        error: "Cannot add this item , try again later\n$e",
      );
    }
    update();
  }

  removeFavoriteProdcut(String prodectID) async {
    try {
      await authControllers.updateUserData(
        {
          Usermodels.FAVORITElIST: FieldValue.arrayRemove(
            [
              prodectID,
            ],
          ),
        },
      );
    } catch (e) {
      customErrorSnakBar(
        error: "Cannot remove this item , try again later\n$e",
      );
    }
    update();
  }
}

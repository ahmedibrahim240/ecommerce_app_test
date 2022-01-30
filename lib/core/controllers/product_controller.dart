import 'package:get/get.dart';
import 'package:ecommerce_app/core/constans/constans.dart';

class ProductControllers extends GetxController {
  static ProductControllers instance = Get.find();

  updataInCartProduct({required var inCart, String? id, required String type}) {
    switch (type) {
      case 'id':
        if (!bestSellingControllers.chcekIsBestProduct(id!)) {
          _updateAllCategoryList(id: id, inCart: inCart);
        } else {
          _updateAllBestProductList(id: id, inCart: inCart);
        }
        update();

        break;
      case 'all':
        _updateAllBestProductList();
        _updateAllCategoryList();
        update();

        break;
    }
  }
}

_updateAllBestProductList({String? id, bool? inCart}) {
  bestSellingControllers.productmodels.forEach(
    (productModels) {
      if (id != null) {
        if (productModels.productId == id) {
          productModels.inCart = inCart!;
        }
      } else {
        productModels.inCart = false;
      }
    },
  );
}

_updateAllCategoryList({String? id, bool? inCart}) {
  categoriesControllers.categoriesmodels.forEach(
    (categoriesmodels) {
      if (categoriesmodels.productList != []) {
        categoriesmodels.productList.forEach(
          (productModels) {
            if (id != null) {
              if (productModels.productId == id) {
                productModels.inCart = inCart!;
              }
            } else {
              productModels.inCart = false;
            }
          },
        );
      }
    },
  );
}

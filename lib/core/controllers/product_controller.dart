import 'package:get/get.dart';
import 'package:ecommerce_app/core/constans/constans.dart';

class ProductControllers extends GetxController {
  static ProductControllers instance = Get.find();

  updataInCartProduct({
    required var inCart,
    String? id,
    required String type,
  }) {
    switch (type) {
      case 'id':
        if (!bestSellingControllers.chcekIsBestProduct(id!)) {
          _updateAllCategoryList(
            id: id,
            inCart: inCart,
            type: 0,
          );
        } else {
          _updateAllBestProductList(
            id: id,
            inCart: inCart,
            type: 0,
          );
        }
        update();

        break;
      case 'all':
        _updateAllBestProductList(type: 0);
        _updateAllCategoryList(type: 0);
        update();

        break;
    }
  }

  updateIsForiteProduct({
    required bool isFavorite,
    String? id,
    required String type,
  }) {
    switch (type) {
      case 'id':
        {
          if (!bestSellingControllers.chcekIsBestProduct(id!)) {
            _updateAllCategoryList(
              id: id,
              isFavorite: isFavorite,
              type: 1,
            );
          } else {
            _updateAllBestProductList(
              id: id,
              isFavorite: isFavorite,
              type: 1,
            );
          }
          update();
        }
        break;
      case 'all':
        {
          _updateAllBestProductList(type: 1);
          _updateAllCategoryList(type: 1);
          update();
        }
        break;
    }
  }

  _updateAllBestProductList(
      {String? id, bool? inCart, bool? isFavorite, required int type}) {
    bestSellingControllers.productmodels.forEach(
      (productModels) {
        if (id != null) {
          if (productModels.productId == id) {
            switch (type) {
              case 0:
                productModels.inCart = inCart!;
                break;
              case 1:
                productModels.isFavorite = isFavorite!;
            }
          }
        } else {
          switch (type) {
            case 0:
              productModels.inCart = false;

              break;
            case 1:
              productModels.isFavorite = false;
          }
        }
      },
    );
  }

  _updateAllCategoryList(
      {String? id, bool? inCart, bool? isFavorite, required int type}) {
    categoriesControllers.categoriesmodels.forEach(
      (categoriesmodels) {
        if (categoriesmodels.productList != []) {
          categoriesmodels.productList!.forEach(
            (productModels) {
              if (id != null) {
                if (productModels.productId == id) {
                  switch (type) {
                    case 0:
                      productModels.inCart = inCart!;
                      break;
                    case 1:
                      productModels.isFavorite = isFavorite!;
                  }
                }
              } else {
                switch (type) {
                  case 0:
                    productModels.inCart = false;

                    break;
                  case 1:
                    productModels.isFavorite = false;
                }
              }
            },
          );
        }
      },
    );
  }
}

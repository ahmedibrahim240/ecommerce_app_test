import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/models/product_models.dart';

class Categoriesmodels {
  String? name, icon, id;
  List<Productmodels>? productList;

  Categoriesmodels({
    this.name,
    this.icon,
    this.productList,
  });
  Categoriesmodels.fromJson(map) {
    name = map['name'];
    id = map['id'];
    icon = map['image'];

    productList = _convertProductItems(map['product'] ?? []);
  }
  List<Productmodels> _convertProductItems(List productFomDb) {
    List<Productmodels> _result = [];
    if (productFomDb.length > 0) {
      productFomDb.forEach((element) {
        Productmodels product = Productmodels.fromJson(
          element,
        );
        product.inCart = cartContllors.isINCartInitial(
          product,
        );
        product.isFavorite = productControllers.isFavoriteProduct(
          product,
        );
        _result.add(product);
      });
    }
    return _result;
  }
}

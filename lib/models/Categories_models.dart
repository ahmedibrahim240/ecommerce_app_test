import 'package:ecommerce_app/models/product_models.dart';

class Categoriesmodels {
  String? name, icon;
  List<Productmodels>? productList;

  Categoriesmodels({
    this.name,
    this.icon,
    this.productList,
  });
  Categoriesmodels.fromJson(map) {
    name = map['name'];
    icon = map['image'];
    productList = _convertProductItems(map['product'] ?? []);
  }
  List<Productmodels> _convertProductItems(List productFomDb) {
    List<Productmodels> _result = [];
    if (productFomDb.length > 0) {
      productFomDb.forEach((element) {
        _result.add(Productmodels.fromJson(element));
      });
    }
    return _result;
  }
  // toJson() {
  //   return {
  //     'name': name,
  //     'image': icon,
  //   };
  // }
}

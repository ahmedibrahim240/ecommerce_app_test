import 'package:ecommerce_app/core/constans/constans.dart';

import 'models.dart';

class Usermodels {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const IMAGE = "image";

  String? id;
  String? name;
  String? email;
  String? image;
  dynamic cart;

  Usermodels({
    this.id,
    this.name,
    this.email,
    this.image,
    this.cart,
  });

  Usermodels.fromJson(snapshot) {
    name = snapshot[NAME];
    email = snapshot[EMAIL];
    id = snapshot[ID];
    image = snapshot[IMAGE];
    cart = _convertCartItems(snapshot[DBCARTNAME] ?? []);
  }
  toJson() {
    return {
      NAME: name,
      ID: id,
      EMAIL: email,
      IMAGE: image,
      DBCARTNAME: cart,
    };
  }

  List<CartItemmodels> _convertCartItems(List cartFomDb) {
    List<CartItemmodels> _result = [];
    if (cartFomDb.length > 0) {
      cartFomDb.forEach((element) {
        _result.add(CartItemmodels.fromjson(element));
      });
    }
    return _result;
  }

  List cartItemsToJson() => cart.map((item) => item.toJson()).toList();
}

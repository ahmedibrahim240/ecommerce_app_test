import 'package:ecommerce_app/core/services/extension_Hexcolor.dart';
import 'package:flutter/cupertino.dart';

class Productmodels {
  String? title, descraptions, image, size, productId;
  Color? color;
  double? price;
  bool? inCart;

  Productmodels({
    this.size,
    this.color,
    this.title,
    this.descraptions,
    this.price,
    this.image,
    this.inCart,
    this.productId,
  });
  Productmodels.fromJson(map) {
    title = map['name'];
    image = map['image'];
    productId = map['id'];
    descraptions = map['descraptions'];
    size = map['size'];
    inCart = map['inCart'];

    color = HexColor.fromHex(map['color']);
    price = double.parse(map['price'].toString());
  }
  toJson() {
    return {
      'name': title,
      'image': image,
      'id': productId,
      'descraptions': descraptions,
      'size': size,
      'inCart': inCart,
      'color': color!.toHex(),
      'price': price,
    };
  }
}

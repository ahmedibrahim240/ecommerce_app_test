import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/services/extension_Hexcolor.dart';
import 'package:flutter/cupertino.dart';

class ProductModels {
  String? title, descraptions, image, size, id;
  Color? color;
  double? price;
  bool? inCart;

  ProductModels({
    this.size,
    this.color,
    this.title,
    this.descraptions,
    this.price,
    this.image,
    this.inCart,
    this.id,
  });
  ProductModels.fromJson(map) {
    title = map['name'];
    image = map['image'];
    id = map['id'];
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
      'id': id,
      'descraptions': descraptions,
      'size': size,
      'inCart': inCart,
      'color': color!.toHex(),
      'price': price,
    };
  }
}

List<ProductModels> bestSellingItemList = [
  ProductModels(
    image: image1,
    title: 'BeoPlay Speaker',
    descraptions: 'Bang and Olufsen',
    price: 755.0,
  ),
  ProductModels(
    image: image2,
    title: 'Leather Wristwatch',
    descraptions: 'Tag Heuer',
    price: 755.0,
  ),
  ProductModels(
    image: image1,
    title: 'BeoPlay Speaker',
    descraptions:
        'Bang and Olufsen Bang and Olufsen Bang and Olufsen Bang and Olufsen Bang and Olufsen Bang and Olufsen',
    price: 755.0,
  ),
  ProductModels(
    image: image2,
    title: 'Leather Wristwatch',
    descraptions: 'Tag Heuer',
    price: 755.0,
  ),
  ProductModels(
    image: image1,
    title: 'BeoPlay Speaker',
    descraptions: 'Bang and Olufsen',
    price: 755.0,
  ),
  ProductModels(
    image: image2,
    title: 'Leather Wristwatch',
    descraptions: 'Tag Heuer',
    price: 755.0,
  ),
];

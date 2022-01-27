import 'package:ecommerce_app/core/constans/constans.dart';

class CartItemmodels {
  String? title;
  String? image;
  double? price;
  String? productId;
  late int quantity;

  CartItemmodels({
    this.image,
    this.title,
    this.price,
    this.quantity = 0,
    this.productId,
  });
  CartItemmodels.fromjson(data) {
    title = data[CARTPRODUCTTITLE];
    image = data[CARTPRODUCTIMAGE];
    price = double.parse(data[CARTPRODUCTPRICE].toString());
    quantity = data[CARTPRODUCTQUANTITIY];
    productId = data[CARTPRODUCTID];
  }
  toJson() {
    return {
      CARTPRODUCTTITLE: title,
      CARTPRODUCTIMAGE: image,
      CARTPRODUCTQUANTITIY: quantity,
      CARTPRODUCTPRICE: price,
      CARTPRODUCTID: productId,
    };
  }
}

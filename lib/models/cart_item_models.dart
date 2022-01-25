import 'package:ecommerce_app/core/constans/constans.dart';

class CartItemmodels {
  String? tilte;
  String? image;
  double? price;
  String? productId;
  late int quantity;

  CartItemmodels({
    this.image,
    this.tilte,
    this.price,
    this.quantity = 0,
    this.productId,
  });
  CartItemmodels.fromjson(data) {
    tilte = data[CARTPRODUCTTITLE];
    image = data[CARTPRODUCTIMAGE];
    price = double.parse(data[CARTPRODUCTPRICE].toString());
    quantity = data[CARTPRODUCTQUANTITIY];
    productId = data[CARTPRODUCTID];
  }
  toJson() {
    return {
      CARTPRODUCTTITLE: tilte,
      CARTPRODUCTIMAGE: image,
      CARTPRODUCTQUANTITIY: quantity,
      CARTPRODUCTPRICE: price,
      CARTPRODUCTID: productId,
    };
  }
}

// class CartItemmodelsList {
//   static const PRODUCT = "prodect";
//   List? cartFirebelist;

//   CartItemmodelsList({this.cartFirebelist});
//   CartItemmodelsList.fromjson(data) {
//     cartFirebelist = data[PRODUCT];
//   }
//   toJson() {
//     return {
//       PRODUCT: cartFirebelist,
//     };
//   }
// }

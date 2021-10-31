import 'package:ecommerce_app/core/services/dp_helpper.dart';

class CartProductMoldes {
  String? tilte;
  String? image;
  double? price;
  String? productId;
  int? quantity;
  int? id;
  CartProductMoldes({
    this.image,
    this.tilte,
    this.price,
    this.quantity,
    this.productId,
  });

  CartProductMoldes.formMap(Map<dynamic, dynamic> data) {
    id = data['id'];
    tilte = data[columnTitle];
    image = data[columnImage];
    price = data[columnPrice];
    quantity = data[columnQuantity];
    productId = data[columnProductId];
  }
  Map<String, dynamic> toMap() => {
        'id': id,
        columnTitle: tilte,
        columnImage: image,
        columnQuantity: quantity,
        columnPrice: price,
        columnProductId: productId,
      };
}

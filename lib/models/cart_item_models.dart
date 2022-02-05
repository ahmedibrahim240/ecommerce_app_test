import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce_app/core/constans/constans.dart';

class CartItemmodels {
  String? title;
  String? image;
  double? price;
  String? productId, id;
  late int quantity;

  CartItemmodels({
    this.image,
    this.title,
    this.price,
    this.quantity = 0,
    this.productId,
    required this.id,
  });
}

class CartFireBaseModel {
  String? productId, id;
  Timestamp? dateCreated;
  int? quantity;

  static const PRODUCTID = "productId";
  static const ID = "Id";
  static const DATECREATED = "dateCreated";
  static const QUANTITIY = 'quantity';

  CartFireBaseModel({
    this.productId,
    this.id,
    this.dateCreated,
    this.quantity,
  });
  CartFireBaseModel.fromJson(DocumentSnapshot snapshot) {
    productId = snapshot[PRODUCTID];
    id = snapshot.id;
    dateCreated = snapshot[DATECREATED];
    quantity = snapshot[QUANTITIY];
  }
  toJson() {
    return {
      PRODUCTID: productId,
      DATECREATED: dateCreated,
      QUANTITIY: quantity,
    };
  }
}

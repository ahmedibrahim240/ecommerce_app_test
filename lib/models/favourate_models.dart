import 'package:cloud_firestore/cloud_firestore.dart';

class FavouriteModels {
  String? productId, id;
  Timestamp? dateCreated;

  static const PRODUCTID = "productId";
  static const ID = "Id";
  static const DATECREATED = "dateCreated";

  FavouriteModels({
    this.productId,
    this.id,
    this.dateCreated,
  });
  FavouriteModels.fromJson(DocumentSnapshot snapshot) {
    productId = snapshot[PRODUCTID];
    id = snapshot.id;
    dateCreated = snapshot[DATECREATED];
  }
  toJson() {
    return {
      PRODUCTID: productId,
      DATECREATED: dateCreated,
    };
  }
}

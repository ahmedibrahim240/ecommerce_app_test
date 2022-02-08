import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/constans/constans.dart';

class OrderHistorymodels {
  static const TITLES = "titles";
  static const ADDRESS = "address";
  static const ORDERDATE = "orderDate";
  static const ID = "id";
  static const DATECREATED = "dateCreated";

  List? titles = [];
  String? address;
  String? orderDate;
  String? id;

  Timestamp? dateCreated;

  OrderHistorymodels({
    this.address,
    this.orderDate,
    this.titles,
    this.id,
    this.dateCreated,
  });
  OrderHistorymodels.fromjson(data) {
    titles = data[TITLES];
    address = data[ADDRESS];
    orderDate = data[ORDERDATE];
    id = data.id;
    dateCreated = data[DATECREATED];
  }
  tojson() {
    return {
      TITLES: titles,
      ADDRESS: address,
      ORDERDATE: orderDate,
      DATECREATED: dateCreated,
    };
  }

  static List<String> getOrderTitleList() {
    List<String> retVul = [];
    cartContllors.cartItemList.forEach(
      (item) {
        retVul.add(item.title!);
      },
    );
    return retVul;
  }
}

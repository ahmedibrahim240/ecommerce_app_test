class OrderHistorymodels {
  static const TITLES = "titles";
  static const ADDRESS = "address";
  static const ORDERDATE = "orderDate";
  static const ID = "id";

  List? titles = [];
  String? address;
  String? orderDate;
  int? id;
  OrderHistorymodels({
    this.address,
    this.orderDate,
    this.titles,
    this.id,
  });
  OrderHistorymodels.fromjson(data) {
    titles = data[TITLES];
    address = data[ADDRESS];
    orderDate = data[ORDERDATE];
    id = data[ID];
  }
  tojson() {
    return {
      TITLES: titles,
      ADDRESS: address,
      ORDERDATE: orderDate,
      ID: id,
    };
  }
}

class OrderHistoryListmodels {
  static const ORDERS = 'orders';
  List? ordersList;
  OrderHistoryListmodels({this.ordersList});
  OrderHistoryListmodels.formjson(data) {
    ordersList = data[ORDERS];
  }
  tojson() {
    return {
      ORDERS: ordersList,
    };
  }
}

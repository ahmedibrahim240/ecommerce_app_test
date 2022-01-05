class OrderHistoryModels {
  static const TITLES = "titles";
  static const ADDRESS = "address";
  static const ORDERDATE = "orderDate";
  static const ID = "id";

  List<String>? titles = [];
  String? address;
  String? orderDate;
  int? id;
  OrderHistoryModels({
    this.address,
    this.orderDate,
    this.titles,
    this.id,
  });
  OrderHistoryModels.fromjson(data) {
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

class OrderHistoryListModels {
  static const ORDERS = 'orders';
  List? ordersList;
  OrderHistoryListModels({this.ordersList});
  OrderHistoryListModels.formjson(data) {
    ordersList = data[ORDERS];
  }
  tojson() {
    return {
      ORDERS: ordersList,
    };
  }
}

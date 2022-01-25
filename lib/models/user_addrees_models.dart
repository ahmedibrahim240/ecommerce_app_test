class Addressmodels {
  static const STREET1 = "street1";
  static const STREET2 = "street2";
  static const CITY = "city";
  static const STATE = "state";
  static const COUNTRY = "country";
  static const ID = "id";

  String? street1;
  String? street2;
  String? city;
  String? state;
  String? country;
  int? id;

  Addressmodels({
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.country,
    this.id,
  });

  Addressmodels.fromJson(snapshot) {
    street2 = snapshot[STREET2];
    city = snapshot[CITY];
    street1 = snapshot[STREET1];
    state = snapshot[STATE];
    country = snapshot[COUNTRY];
    id = snapshot[ID];
  }
  toJson() {
    return {
      STREET2: street2,
      STREET1: street1,
      CITY: city,
      STATE: state,
      COUNTRY: country,
      ID: id,
    };
  }
}

class AddressListmodels {
  static const ADDRESSES = "addresses";
  List? addresses;
  AddressListmodels({this.addresses});
  AddressListmodels.fromJson(data) {
    addresses = data[ADDRESSES];
  }
  toJson() {
    return {
      ADDRESSES: addresses,
    };
  }
}

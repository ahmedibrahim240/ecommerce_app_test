class AddressModel {
  static const STREET1 = "street1";
  static const STREET2 = "street2";
  static const CITY = "city";
  static const STATE = "state";
  static const COUNTRY = "country";

  String? street1;
  String? street2;
  String? city;
  String? state;
  String? country;

  AddressModel({
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.country,
  });

  AddressModel.fromJson(snapshot) {
    street2 = snapshot[STREET2];
    city = snapshot[CITY];
    street1 = snapshot[STREET1];
    state = snapshot[STATE];
    country = snapshot[COUNTRY];
  }
  toJson() {
    return {
      STREET2: street2,
      STREET1: street1,
      CITY: city,
      STATE: state,
      COUNTRY: country,
    };
  }
}

class AddressListModels {
  static const ADDRESSES = "addresses";
  List? addresses;
  AddressListModels({this.addresses});
  AddressListModels.fromJson(data) {
    addresses = data[ADDRESSES];
  }
  toJson() {
    return {
      ADDRESSES: addresses,
    };
  }
}

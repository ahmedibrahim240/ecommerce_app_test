import 'package:cloud_firestore/cloud_firestore.dart';

class Addressmodels {
  static const STREET1 = "street1";
  static const STREET2 = "street2";
  static const CITY = "city";
  static const STATE = "state";
  static const COUNTRY = "country";
  static const ID = "id";
  static const ISARLANG = "isARLang";
  static const DATECREATED = "dateCreated";
  static const ISSHOPPING = "isShopping";

  String? street1;
  String? street2;
  String? city;
  String? state;
  String? country;
  String? id;
  Timestamp? dateCreated;
  bool? isARLang;
  late bool isShopping;

  Addressmodels({
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.country,
    this.id,
    this.dateCreated,
    this.isARLang,
    this.isShopping = true,
  });

  Addressmodels.fromJson(DocumentSnapshot snapshot) {
    street2 = snapshot[STREET2];
    city = snapshot[CITY];
    street1 = snapshot[STREET1];
    state = snapshot[STATE];
    country = snapshot[COUNTRY];
    id = snapshot.id;
    dateCreated = snapshot[DATECREATED];
    isARLang = snapshot[ISARLANG];
    isShopping = snapshot[ISSHOPPING];
  }
  toJson() {
    return {
      STREET2: street2,
      STREET1: street1,
      CITY: city,
      STATE: state,
      COUNTRY: country,
      DATECREATED: dateCreated,
      ISARLANG: isARLang,
      ISSHOPPING: isShopping,
    };
  }
}

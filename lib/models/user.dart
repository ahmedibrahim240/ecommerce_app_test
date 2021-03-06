class Usermodels {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const IMAGE = "image";

  String? id;
  String? name;
  String? email;
  String? image;

  Usermodels({
    this.id,
    this.name,
    this.email,
    this.image,
  });

  Usermodels.fromJson(snapshot) {
    name = snapshot[NAME];
    email = snapshot[EMAIL];
    id = snapshot[ID];
    image = snapshot[IMAGE];
  }
  toJson() {
    return {
      NAME: name,
      ID: id,
      EMAIL: email,
      IMAGE: image,
    };
  }
}

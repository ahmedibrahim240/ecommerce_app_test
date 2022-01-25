import 'package:ecommerce_app/core/constans/constans.dart';

class Categoriesmodels {
  String? name, icon;

  Categoriesmodels({
    this.name,
    this.icon,
  });
  Categoriesmodels.fromJson(map) {
    name = map['name'];
    icon = map['image'];
  }
  toJson() {
    return {
      'name': name,
      'image': icon,
    };
  }
}

List<Categoriesmodels> categorsList = [
  Categoriesmodels(
    name: 'Men',
    icon: menIcon,
  ),
  Categoriesmodels(
    name: 'Women',
    icon: womenIcon,
  ),
  Categoriesmodels(
    name: 'Devices',
    icon: devicesIcon,
  ),
  Categoriesmodels(
    name: 'Gadgets',
    icon: gadgetsIcon,
  ),
  Categoriesmodels(
    name: 'Gaming',
    icon: gameIcon,
  ),
];

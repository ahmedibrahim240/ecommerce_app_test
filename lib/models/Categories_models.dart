import 'package:ecommerce_app/core/constans/constans.dart';

class CategoriesModels {
  String? name, icon;

  CategoriesModels({
    this.name,
    this.icon,
  });
  CategoriesModels.fromJson(map) {
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

List<CategoriesModels> categorsList = [
  CategoriesModels(
    name: 'Men',
    icon: menIcon,
  ),
  CategoriesModels(
    name: 'Women',
    icon: womenIcon,
  ),
  CategoriesModels(
    name: 'Devices',
    icon: devicesIcon,
  ),
  CategoriesModels(
    name: 'Gadgets',
    icon: gadgetsIcon,
  ),
  CategoriesModels(
    name: 'Gaming',
    icon: gameIcon,
  ),
];

import 'package:ecommerce_app/core/constans/constans.dart';

class NavBarItemsMoldes {
  final String title, icon;

  NavBarItemsMoldes({required this.title, required this.icon});
}

List<NavBarItemsMoldes> navBarItemList = [
  NavBarItemsMoldes(
    icon: exploreIcon,
    title: 'Explore',
  ),
  NavBarItemsMoldes(
    icon: cartIcon,
    title: 'Cart',
  ),
  NavBarItemsMoldes(
    icon: userIcon,
    title: 'Account',
  ),
];

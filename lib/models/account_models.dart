import 'package:ecommerce_app/core/constans/asset_paths.dart';

class Accountmodels {
  late String? icon;
  late String title;

  Accountmodels({
    this.icon,
    required this.title,
  });
}

List<Accountmodels> accountList = [
  // Accountmodels(
  //   icon: editIcon,
  //   title: 'Edit Profile',
  // ),
  // Accountmodels(
  //   icon: addressIcon,
  //   title: 'Shipping Address',
  // ),
  Accountmodels(
    icon: historyIcon,
    title: 'Order History',
  ),
  // Accountmodels(
  //   icon: cardsIcon,
  //   title: 'Cards',
  // ),
  // Accountmodels(
  //   icon: notificationIcon,
  //   title: 'Notifications',
  // ),
  Accountmodels(
    title: 'Dark',
  ),
  Accountmodels(
    title: 'Using device theme mode',
  ),
  Accountmodels(
    icon: logOutIcon,
    title: 'Log Out',
  ),
];

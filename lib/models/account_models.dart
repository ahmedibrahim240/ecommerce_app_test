import 'package:ecommerce_app/core/constans/asset_paths.dart';

class AccountModels {
  late String? icon;
  late String title;

  AccountModels({
    this.icon,
    required this.title,
  });
}

List<AccountModels> accountList = [
  // AccountModels(
  //   icon: editIcon,
  //   title: 'Edit Profile',
  // ),
  // AccountModels(
  //   icon: addressIcon,
  //   title: 'Shipping Address',
  // ),
  AccountModels(
    icon: historyIcon,
    title: 'Order History',
  ),
  // AccountModels(
  //   icon: cardsIcon,
  //   title: 'Cards',
  // ),
  // AccountModels(
  //   icon: notificationIcon,
  //   title: 'Notifications',
  // ),
  AccountModels(
    title: 'Dark',
  ),
  AccountModels(
    title: 'Using device theme mode',
  ),
  AccountModels(
    icon: logOutIcon,
    title: 'Log Out',
  ),
];

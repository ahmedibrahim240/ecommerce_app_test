import 'package:ecommerce_app/core/services/network_services/network_sensitive.dart';
import 'package:flutter/material.dart';
import '../account_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: FavouriteBody(),
    );
  }
}

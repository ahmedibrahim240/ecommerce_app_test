import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/custom_text.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_buttom.dart';
import 'package:ecommerce_app/core/services/network_services/network_sensitive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../account_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favourites'),
          actions: [_apbarActions()],
        ),
        body: FavouriteBody(),
      ),
    );
  }

  _apbarActions() {
    return Obx(
      () => favoritesConttroller.favorieitemsList.isEmpty
          ? Container()
          : CustomButtom(
              onPreessed: () async {
                await favoritesConttroller.clearFavoriteProdcut();
              },
              bgColor: Colors.transparent,
              borderColor: Colors.red,
              borderWidth: 3,
              borderRdius: 30,
              margin: EdgeInsets.symmetric(horizontal: defaultSize * 2),
              child: Row(
                children: [
                  Icon(
                    Icons.clear,
                    color: Colors.red,
                    size: 20,
                  ),
                  SizedBox(width: defaultSize),
                  CustomText(
                    text: 'Clear All',
                    fontSize: 12,
                    color: Colors.red,
                    textAlign: TextAlign.center,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
    );
  }
}

import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/controllers.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../account_widget.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (FavoritesConttroller favController) {
      return Scaffold(
        appBar: _favAppBar(favController),
        body: (favController.favouriteItemsList.isEmpty)
            ? EmptyData(
                icon: emptyFavourite,
                text: 'Empty Favourites..',
              )
            : CustomRefreshWidget(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: favController.favouriteItemsList.length,
                  padding:
                      EdgeInsets.only(top: defaultSize, bottom: defaultSize),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemBuilder: (_, index) {
                    Productmodels product =
                        favController.favouriteItemsList[index];
                    return BuildFavouriteItem(
                      product: product,
                    );
                  },
                ),
              ),
      );
    });
  }

  _favAppBar(FavoritesConttroller favController) {
    return AppBar(
      title: Text('Favourites'),
      actions: [
        favController.favouriteItemsList.isEmpty
            ? Container()
            : CustomButtom(
                onPreessed: () async {
                  await favController.clearFavoriteProdcut();
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
      ],
    );
  }
}

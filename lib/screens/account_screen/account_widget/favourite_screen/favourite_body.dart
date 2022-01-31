import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../account_widget.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (favoritesConttroller.favorieitemsList.isEmpty)
          ? EmptyData(
              icon: emptyFavourite,
              text: 'Empty Favourites..',
            )
          : CustomRefreshWidget(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: favoritesConttroller.favorieitemsList.length,
                padding: EdgeInsets.only(top: defaultSize, bottom: defaultSize),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemBuilder: (_, index) {
                  Productmodels product =
                      favoritesConttroller.favorieitemsList[index];
                  return BuildFavouriteItem(
                    product: product,
                  );
                },
                // separatorBuilder: (BuildContext context, int index) =>
                //     SizedBox(height: defaultSize * 2),
              ),
            ),
    );
  }
}

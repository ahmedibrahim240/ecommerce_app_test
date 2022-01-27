import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/core/services/network_services/network_sensitive.dart';
import 'package:ecommerce_app/models/Categories_models.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CategoriesPageItem extends GetWidget {
  final Categoriesmodels categoriesmodels;

  const CategoriesPageItem({
    Key? key,
    required this.categoriesmodels,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: _appBarTitle(context),
        toolbarHeight: 70,
      ),
      body: NetworkSensitive(
        child: (categoriesmodels.productList!.isEmpty)
            ? NODataYet()
            : AllProductBody(
                productlist: categoriesmodels.productList!,
              ),
      ),
    );
  }

  Row _appBarTitle(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Hero(
          tag: 'icon${categoriesmodels.icon}',
          child: CircleAvatar(
            radius: defaultSize * 3,
            backgroundColor: Colors.white,
            child: CustomCachedNetworkImage(
              context: context,
              url: categoriesmodels.icon,
              boxFit: BoxFit.fitWidth,
            ),
          ),
        ),
        SizedBox(
          width: defaultSize,
        ),
        Hero(
          tag: 'title${categoriesmodels.name}',
          child: Text('${categoriesmodels.name} Section'),
        ),
      ],
    );
  }
}

class NODataYet extends StatelessWidget {
  const NODataYet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          emptyitemdata,
          height: defaultSize * 23.2,
          width: defaultSize * 23.2,
        ),
        Center(
          child: CustomText(
            text: 'Not have data yet..',
            alignment: Alignment.center,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

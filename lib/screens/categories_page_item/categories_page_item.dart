import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CategoriesPageItem extends StatelessWidget {
  final String title;
  final String icon;

  const CategoriesPageItem({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: _appBarTitle(context),
        toolbarHeight: 70,
      ),
      body: Column(
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
      ),
    );
  }

  Row _appBarTitle(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Hero(
          tag: 'icon$icon',
          child: CircleAvatar(
            radius: defaultSize * 3,
            backgroundColor: Colors.white,
            child: CustomCachedNetworkImage(
              context: context,
              url: icon,
              boxFit: BoxFit.fitWidth,
            ),
          ),
        ),
        SizedBox(
          width: defaultSize,
        ),
        Hero(
          tag: 'title$title',
          child: Text('$title Section'),
        ),
      ],
    );
  }
}

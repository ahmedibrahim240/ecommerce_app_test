import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'home_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          defaultSize * 2,
          defaultSize * 2,
          defaultSize * 2,
          0.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _noteTest(),
              SizedBox(height: defaultSize * 1.5),
              CustomSearchTextForm(),
              SizedBox(height: defaultSize * 3),
              CategoriesSection(),
              SizedBox(height: defaultSize * 3),
              BestSellingSections(),
            ],
          ),
        ),
      ),
    );
  }

  _noteTest() {
    return CustomText(
      text: 'Note => This app for test and learn GETX.....',
      fontSize: 10,
      color: Colors.grey.shade500,
    );
  }
}

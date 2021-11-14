import 'package:ecommerce_app/core/constans/constans.dart';
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
}

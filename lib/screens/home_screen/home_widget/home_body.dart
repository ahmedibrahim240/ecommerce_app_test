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
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchTextForm(),
              const SizedBox(height: 30),
              CategoriesSection(),
              const SizedBox(height: 30),
              BestSellingSections(),
            ],
          ),
        ),
      ),
    );
  }
}

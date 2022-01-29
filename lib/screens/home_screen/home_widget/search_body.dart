import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AllProductBody(
      productlist: searchController.searchList,
    );
  }
}

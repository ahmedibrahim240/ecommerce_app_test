import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/core/services/network_services/network_sensitive.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:flutter/material.dart';

class AllProcutScreen extends StatelessWidget {
  final List<Productmodels> productlist;

  const AllProcutScreen({
    Key? key,
    required this.productlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Best Selling'),
      ),
      body: NetworkSensitive(child: AllProductBody(productlist: productlist)),
    );
  }
}

class AllProductBody extends StatelessWidget {
  final List<Productmodels> productlist;
  const AllProductBody({
    Key? key,
    required this.productlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: productlist.length,
      padding: EdgeInsets.only(top: defaultSize, bottom: defaultSize),
      itemBuilder: (_, index) {
        return BuildProdectItem(
          product: productlist[index],
          isAll: true,
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: defaultSize * 2),
    );
  }
}

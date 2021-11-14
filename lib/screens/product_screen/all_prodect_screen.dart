import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/core/services/network_services/network_sensitive.dart';
import 'package:flutter/material.dart';

class AllProcutScreen extends StatelessWidget {
  const AllProcutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Best Selling'),
      ),
      body: NetworkSensitive(child: AllProductBody()),
    );
  }
}

class AllProductBody extends StatelessWidget {
  const AllProductBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: bestSellingControllers.productModels.length,
      padding: EdgeInsets.only(top: defaultSize, bottom: defaultSize),
      itemBuilder: (_, index) {
        return BuildBestSellingItem(
          product: bestSellingControllers.productModels[index],
          isAll: true,
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: defaultSize * 2),
    );
  }
}
